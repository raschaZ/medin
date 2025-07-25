<?php

namespace App\Mixins\Certificate;

use App\Mail\CertificateGenerated;
use App\Models\Category;
use App\Models\Certificate;
use App\Models\CertificateTemplate;
use App\Models\UserMeta;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;
use SimpleSoftwareIO\QrCode\Facades\QrCode;
use Barryvdh\DomPDF\Facade\Pdf;
use Dompdf\Dompdf;
use Dompdf\Options;
use Exception;
use Spatie\Browsershot\Browsershot;

class MakeCertificate
{
    public function makeQuizCertificate($quizResult)
    {
        $template = CertificateTemplate::where('status', 'publish')
            ->where('type', 'quiz')
            ->first();

        if (!empty($template)) {
            $quiz = $quizResult->quiz;
            $user = $quizResult->user;

            $userCertificate = $this->saveQuizCertificate($user, $quiz, $quizResult);

            $body = $this->makeBody(
                $template,
                $userCertificate,
                $user,
                $template->body,
                $quiz->webinar ? $quiz->webinar->title : '-',
                $quizResult->user_grade,
                $quiz->webinar->teacher->id,
                $quiz->webinar->teacher->full_name,
                $quiz->webinar->duration);

            $data = [
                'body' => $body
            ];

            $html = (string)view()->make('admin.certificates.create_template.show_certificate', $data);
            return $this->sendToApi($userCertificate, $html);
        }

        abort(404);
    }

    public function saveQuizCertificate($user, $quiz, $quizResult)
    {
        $certificate = Certificate::where('quiz_id', $quiz->id)
            ->where('student_id', $user->id)
            ->where('quiz_result_id', $quizResult->id)
            ->first();

        $data = [
            'quiz_id' => $quiz->id,
            'student_id' => $user->id,
            'quiz_result_id' => $quizResult->id,
            'user_grade' => $quizResult->user_grade,
            'type' => 'quiz',
            'created_at' => $quizResult->created_at,
        ];

        if (!empty($certificate)) {
            $certificate->update($data);
        } else {
            $certificate = Certificate::create($data);

            $notifyOptions = [
                '[c.title]' => $quiz->webinar ? $quiz->webinar->title : '-',
            ];
            sendNotification('new_certificate', $notifyOptions, $user->id);
        }

        return $certificate;
    }

    private function makeBody($template, $userCertificate, $user, $body, $courseTitle = null, $userGrade = null, $teacherId = null, $teacherFullName = null, $duration = null)
    {
        $platformName = getGeneralSettings("site_name");

        $body = str_replace('[student]', $user->full_name, $body);
        $body = str_replace('[student_name]', $user->full_name, $body);
        $body = str_replace('[platform_name]', $platformName, $body);
        $body = str_replace('[course]', $courseTitle, $body);
        $body = str_replace('[course_name]', $courseTitle, $body);
        $body = str_replace('[grade]', $userGrade, $body);
        $body = str_replace('[certificate_id]', $userCertificate->id, $body);
        $body = str_replace('[date]', dateTimeFormat($userCertificate->created_at, 'j M Y | H:i'), $body);
        $body = str_replace('[instructor_name]', $teacherFullName, $body);
        $body = str_replace('[duration]', $duration, $body);

        $qrCode = $this->makeQrCode($template);

        if (!empty($qrCode)) {
            $body = str_replace('[qr_code]', $qrCode, $body);
        }

        $instructorSignatureImg = null;
        if (!empty($teacherId)) {
            $instructorSignature = UserMeta::query()->where('user_id', $teacherId)
                ->where('name', 'signature')
                ->first();
            $instructorSignatureImg = (!empty($instructorSignature) and !empty($instructorSignature->value)) ? url($instructorSignature->value) : null;

            if (!empty($instructorSignatureImg)) {
                $instructorSignatureImg = "<img src='{$instructorSignatureImg}' style='max-width: 100%; max-height: 100%'/>";
            }
        }

        $body = str_replace('[instructor_signature]', $instructorSignatureImg, $body);

        $userCertificateAdditional = $user->userMetas->where('name', 'certificate_additional')->first();
        $userCertificateAdditionalValue = !empty($userCertificateAdditional) ? $userCertificateAdditional->value : null;
        $body = str_replace('[user_certificate_additional]', $userCertificateAdditionalValue, $body);

        return $body;
    }

    private function makeQrCode($template)
    {
        $size = 128;
        $elements = $template->elements;

        if (!empty($elements) and !empty($elements['qr_code']) and !empty($elements['qr_code']['image_size'])) {
            $size = (int)$elements['qr_code']['image_size'];
        }

        $url = url("/certificate_validation");
        return QrCode::size($size)->generate($url);
    }

    private function makeImage($certificateTemplate, $body)
    {
        $img = Image::make(public_path($certificateTemplate->image));


        if ($certificateTemplate->rtl) {
            $Arabic = new \I18N_Arabic('Glyphs');
            $body = $Arabic->utf8Glyphs($body);
        }

        $img->text($body, $certificateTemplate->position_x, $certificateTemplate->position_y, function ($font) use ($certificateTemplate) {
            $font->file($certificateTemplate->rtl ? public_path('assets/default/fonts/vazir/Vazir-Medium.ttf') : public_path('assets/default/fonts/Montserrat-Medium.ttf'));
            $font->size($certificateTemplate->font_size);
            $font->color($certificateTemplate->text_color);
            $font->align($certificateTemplate->rtl ? 'right' : 'left');
        });

        return $img;
    }

    public function makeCourseCertificate($certificate, $user = null)
    {
        $template = CertificateTemplate::where('status', 'publish')
            ->where('type', (($user->id == $certificate->webinar->teacher->id)?'instructor':'course'))
            ->first();
 
        $course = $certificate->webinar;
           
        if (!empty($template) and !empty($course)) {
            $user = $certificate->student;

            $userCertificate = $this->saveCourseCertificate($user, $course);
            $locale = app()->getLocale();
            $body = (!empty($template->translate($locale)) and !empty($template->translate($locale)->body)) ? $template->translate($locale)->body : $template->body;

            $body = $this->makeBody(
                $template,
                $userCertificate,
                $user,
                $body,
                $course->title,
                null,
                $course->teacher->id,
                $course->teacher->full_name,
                $course->duration);

            $data = [
                'body' => $body
            ];
            $html = (string)view()->make('admin.certificates.create_template.show_certificate', $data);
            return $this->sendToApi($userCertificate, $html);
        }

        $toastData = [
            'title' => trans('public.request_failed'),
            'msg' => trans('update.no_certificate_template_is_defined_for_courses'),
            'status' => 'error'
        ];
        return redirect()->back()->with(['toast' => $toastData]);
    }
    public function makeCourseCertificateStudent($certificate, $user = null)
    {
      
        $certificate->quiz_id?
            $type= ($user?$user->id == $certificate->quiz->teacher->id:false)?'instructor':'quiz': 
                 $type= ($user?$user->id == $certificate->webinar->teacher->id:false)?'instructor':'course';
        $template = CertificateTemplate::where('status', 'publish')
         ->where('type', $type)
         ->where('category_id',  $certificate->quiz_id?$certificate->quiz->webinar->category_id: $certificate->webinar->category_id)
         ->first();
        $course = $certificate->webinar??  $certificate->quiz->webinar;
        if ( !empty($course) && !($template == null)  ) {
            $user = $certificate->student;

            $userCertificate = $this->saveCourseCertificate($user, $course);

            return $this->generateAndSavePdf($userCertificate, $template,$type,false);
        }

        $toastData = [
            'title' => trans('public.request_failed'),
            'msg' => trans('update.no_certificate_template_is_defined_for_courses'),
            'status' => 'error'
        ];
        return redirect()->back()->with(['toast' => $toastData]);
    }
    public function makeBundleCertificate($certificate)
    {

        $template = CertificateTemplate::where('status', 'publish')
            ->where('type', 'bundle')
            ->first();

        $bundle = $certificate->bundle;

        if (!empty($template) and !empty($bundle)) {
            $user = $certificate->student;

            $userCertificate = $this->saveBundleCertificate($user, $bundle);
            $locale = app()->getLocale();
            $body = (!empty($template->translate($locale)) and !empty($template->translate($locale)->body)) ? $template->translate($locale)->body : $template->body;

            $body = $this->makeBody(
                $template,
                $userCertificate,
                $user,
                $body,
                $bundle->title,
                null,
                $bundle->teacher->id,
                $bundle->teacher->full_name,
                $bundle->duration);

            $data = [
                'body' => $body
            ];

            $html = (string)view()->make('admin.certificates.create_template.show_certificate', $data);
            return $this->sendToApi($userCertificate, $html);
        }

        $toastData = [
            'title' => trans('public.request_failed'),
            'msg' => trans('update.no_certificate_template_is_defined_for_bundles'),
            'status' => 'error'
        ];

        return redirect()->back()->with(['toast' => $toastData]);
    }

    private function sendToApi($certificate, $html)
    {
        $userId = getCertificateMainSettings("certificate_api_user_id");
        $APIKey = getCertificateMainSettings("certificate_api_key");

        $data = [
            'html' => $html,
            'viewport_width' => CertificateTemplate::$templateWidth,
            'viewport_height' => CertificateTemplate::$templateHeight,
        ];

        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, "https://hcti.io/v1/image?width=400");
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));

        curl_setopt($ch, CURLOPT_POST, 1);

        // Retrieve your user_id and api_key from https://htmlcsstoimage.com/dashboard
        curl_setopt($ch, CURLOPT_USERPWD, "{$userId}" . ":" . "{$APIKey}");

        $headers = array();
        $headers[] = "Content-Type: application/x-www-form-urlencoded";
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

        $result = curl_exec($ch);
        if (curl_errno($ch)) {
            echo 'Error:' . curl_error($ch);
        }
        curl_close($ch);
        $res = json_decode($result, true);
       
        if (!empty($res['url'])) {
            $url = $res['url'] . ".png";
            $image = file_get_contents($url);
            $storage = Storage::disk('public');
            $path = auth()->id() . '/certificates';
            if (!$storage->exists($path)) {
                $storage->makeDirectory($path);
            }
            $fileName = "certificate_{$certificate->id}.png";
            $path = $path . '/' . $fileName;
            $storage->put($path, $image);
            $url = public_path($storage->url($path));
            $headers = array(
                'Content-Type: image/jpeg',
            );

            return response()->download($url, "certificate.png", $headers);
        } elseif (!empty($res['error']) and $res['error'] == "Plan limit exceeded") {
            $error = trans('update.plan_limit_exceeded');
        } else {
            $error = trans("update.bad_request");
        }
        $toastData = [
            'title' => trans('public.request_failed'),
            'msg' => $error,
            'status' => 'error'
        ];
        return redirect()->back()->with(['toast' => $toastData]);
    }

    public function saveCourseCertificate($user, $course)
    {
        $certificate = Certificate::where('webinar_id', $course->id)
            ->where('student_id', $user->id)
            ->first();

        $data = [
            'webinar_id' => $course->id,
            'student_id' => $user->id,
            'type' => 'course',
            'created_at' => time()
        ];

        if (!empty($certificate)) {
            $certificate->update($data);
        } else {
            $certificate = Certificate::create($data);

            $notifyOptions = [
                '[c.title]' => $course->title,
            ];
            sendNotification('new_certificate', $notifyOptions, $user->id);
        }

        return $certificate;
    }

    public function saveBundleCertificate($user, $bundle)
    {
        $certificate = Certificate::where('bundle_id', $bundle->id)
            ->where('student_id', $user->id)
            ->first();

        $data = [
            'bundle_id' => $bundle->id,
            'student_id' => $user->id,
            'type' => 'bundle',
            'created_at' => time()
        ];

        if (!empty($certificate)) {
            $certificate->update($data);
        } else {
            $certificate = Certificate::create($data);

            $notifyOptions = [
                '[c.title]' => $bundle->title,
            ];
            sendNotification('new_certificate', $notifyOptions, $user->id);
        }

        return $certificate;
    }

    public function makeCourseCertificateTeacher($teacher, $course)
    {
        
        // Retrieve the certificate template
        $template = CertificateTemplate::where('status', 'publish')
            ->where('type', 'instructor')
            ->where('category_id', $course->category_id)
            ->first();
    
        // Validate course and template
        if (empty($course) || empty($template)) {
            $toastData = [
                'title' => trans('public.request_failed'),
                'msg' => trans('update.no_certificate_template_is_defined_for_courses'),
                'status' => 'error'
            ];
            return redirect()->back()->with(['toast' => $toastData]);
        }
       
        // Retrieve or create the certificate record
        $user = $course->teacher;
        $userCertificate = Certificate::firstOrCreate(
            ['webinar_id' => $course->id, 'student_id' => $user->id],
            [
                'type' => 'course',
                'created_at' => time()
            ]
        );

        // Generate and save the PDF
        $pathSave =$this->generateAndSavePdf($userCertificate, $template, 'instructor',true,false,$teacher);


        // Ensure the file name is safe
        $safeTeacherName = $teacher->name ? str_replace(' ', '_', $teacher->name) : $userCertificate->id;
        $certificateUrl = url("store/certificates/{$user->id}/certificate_{$safeTeacherName}.pdf");
        try {
            \Mail::to($teacher->email)->send(new CertificateGenerated($certificateUrl,$teacher,$course));
        } catch (Exception $exception) {
            //  dd($exception);
             abort(404);
        }
        // Send the certificate link via email
        // Mail::to($teacher->email)->send(new CertificateGenerated($certificateUrl));

        // Return a success response
        $toastData = [
            'title' => trans('public.request_success'),
            'msg' => trans('update.certificate_generated_and_email_sent'),
            'status' => 'success'
        ];
        return redirect()->back()->with(['toast' => $toastData]);
    }
    
    private function generateAndSavePdf($certificate, $template, $type, $returnPath=false,$showQr=true,$teacher=null )
    {
        // Define the storage path and filename
        $userId = $certificate->student_id;
        $path = "certificates/{$userId}";

        $safeTeacherName =($teacher && $teacher->name) ? str_replace(' ', '_', $teacher->name) : $certificate->id;

        $fileName = "certificate_{$safeTeacherName}.pdf"; 
           
        // Ensure the storage path exists
        $storage = Storage::disk('public');
        if (!$storage->exists($path)) {
            $storage->makeDirectory($path);
        }
    
        $fullPath = $path . '/' . $fileName;
    
        // Convert background image to base64
        $backgroundPath = public_path($template->image);
        $backgroundImage = '';
        if (file_exists($backgroundPath)) {
            $imageData = file_get_contents($backgroundPath);
            $base64 = base64_encode($imageData);
            $backgroundImage = 'data:image/png;base64,' . $base64;
        }
    
        // Generate the QR code as a base64 image
        $url = url("/certificate_validation");
        $qrCodeImage = base64_encode(QrCode::format('png')->size(100)->generate($url));
    
        // Replace placeholders in template body
        $title = htmlspecialchars($certificate->webinar->getTitleAttribute());
        $date = dateTimeFormat($certificate->created_at, "j M Y");
        $body = isset($template->body) 
            ? str_replace([':title', ':date'], [$title, $date], $template->body) 
            : '';
    
        if ($body) {
            // Use regex to remove the style attribute from the first <div>
            $body = preg_replace('/<div([^>]*?)\sstyle="[^"]*"/', '<div$1', $body, 1);
        }
    
        // Build the HTML content
        $htmlContent = view('certificate_template', [
            'backgroundImage' => $backgroundImage,
            'teacherName' => ($type === 'instructor') ? 'Dr ' . htmlspecialchars($teacher->name??$certificate->webinar->teacher->full_name) : htmlspecialchars($teacher->name??$certificate->student->full_name),
            'body' => $body,
            'showQr'=> $showQr,
            'qrCodeImage' => $qrCodeImage,
            'certificateId' => $certificate->id
        ])->render();
    
        // Generate the PDF using Dompdf
        $pdf = PDF::loadHTML($htmlContent)
            ->setPaper('a4', 'landscape')
            ->setWarnings(false);
    
        // Save the PDF to the specified path
        $storage->put($fullPath, $pdf->output());

        if($returnPath){
            return $storage->path($fullPath);
        }
            
        // Generate URL for download
        $downloadPath = $storage->path($fullPath);
    
        // Return a downloadable response
        return response()->download($downloadPath, $fileName, ['Content-Type' => 'application/pdf']);
    }
    
}
