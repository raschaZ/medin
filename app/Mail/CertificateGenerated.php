<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class CertificateGenerated extends Mailable
{
    use Queueable, SerializesModels;

    public $certificateUrl;
    public $teacher;
    public $course;

    /**
     * Create a new message instance.
     *
     * @param string $certificateUrl
     * @param TeacherCertificates $teacher
     * @param Webinar $course
     */
    public function __construct($certificateUrl,$teacher,$course)
    {
        $this->certificateUrl = $certificateUrl;
        $this->teacher = $teacher;
        $this->course = $course;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->subject('Your Course Certificate')
            ->view('emails.certificate_generated')
            ->with([
                    'certificateUrl' => $this->certificateUrl,
                    'teacher' => $this->teacher,
                    'course' => $this->course
                ]);
    }
}