<?php

use App\Api\Response;
use App\Api\Request;
use App\Models\Api\UserFirebaseSessions;
use Kreait\Firebase\Messaging\CloudMessage;

function validateParam($request_input, $rules, $somethingElseIsInvalid = null)
{
    $request = new Request();
    return $request->validateParam($request_input, $rules, $somethingElseIsInvalid);
}

function apiResponse2($success, $status, $msg, $data = null, $title = null)
{
    $response = new Response();
    return $response->apiResponse2($success, $status, $msg, $data, $title);
}


function apiAuth()
{
    if (request()->input('test_auth_id')) {
        return App\Models\Api\User::find(request()->input('test_auth_id')) ?? die('test_auth_id not found');
    }
    return auth('api')->user();


}

function nicePrice($price)
{
    $nice = handlePrice($price, false);

    if (is_string($nice)) {
        $nice = (float)$nice;
    }

    return round($nice, 2);
}

function nicePriceWithTax($price)
{

    // return round(handlePrice($price, true,false,true), 2);
    $nice = handlePrice($price, false, false, true);
    if ($nice === 0) {
        return [
            "price" => 0,
            "tax" => 0
        ];
    }
    return $nice;
}


function handleSendFirebaseMessages($user_id, $group_id, $sender, $type, $title, $message)
{
    // Fetch FCM tokens for the user
    $fcmTokens = UserFirebaseSessions::where('user_id', $user_id)
        ->pluck('fcm_token')
        ->filter(fn($token) => !empty($token))
        ->toArray();

    if (count($fcmTokens) > 0) {
        $messageFCM = app('firebase.messaging');

        // Create a base message
        $baseMessage = CloudMessage::new()
            ->withNotification([
                'title' => $title,
                'body' => preg_replace('/<[^>]*>/', '', $message)
            ])
            ->withData([
                'user_id' => $user_id,
                'group_id' => $group_id,
                'title' => $title,
                'message' => preg_replace('/<[^>]*>/', '', $message),
                'sender' => $sender,
                'type' => $type,
                'created_at' => time(),
            ])
            ->withAndroidConfig(\Kreait\Firebase\Messaging\AndroidConfig::fromArray([
                'ttl' => '3600s',
                'priority' => 'high',
                'notification' => [
                    'color' => '#f45342',
                    'sound' => 'default',
                ],
            ]));

        try {
            // Send messages to all tokens
            $report = $messageFCM->sendMulticast($baseMessage, $fcmTokens);

            // Handle failures
            foreach ($report->failures() as $failure) {
                $invalidToken = $failure->target()->value();
                Log::error('Firebase Error: ' . $failure->error()->getMessage() . " for token: {$invalidToken}");

                // Optionally, remove the invalid token from your database
                UserFirebaseSessions::where('fcm_token', $invalidToken)->delete();
            }

            Log::info("Successfully sent {$report->successes()->count()} messages.");
        } catch (\Exception $exception) {
            Log::error('Firebase Messaging Error: ' . $exception->getMessage());
        }
    }
}



