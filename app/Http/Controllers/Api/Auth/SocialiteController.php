<?php

namespace App\Http\Controllers\Api\Auth;

use App\Http\Controllers\Controller;
use App\Models\Affiliate;
use App\Models\Api\UserFirebaseSessions;
use App\Models\Role;
use Illuminate\Http\Request;
use Laravel\Socialite\Facades\Socialite;
use Illuminate\Support\Facades\Auth;
use Exception;
use App\User;

class SocialiteController extends Controller
{

    public function redirectToGoogle()
    {
        return Socialite::driver('google')->stateless()->redirect();
    }

    public function handleGoogleCallback(Request $request)
    {
        $this->validateRequest($request);

        $data = $request->all();
        $user = User::where('google_id', $data['id'])
            ->orWhere('email', $data['email'])
            ->first();

        $isRegistered = !empty($user);

        if (!$isRegistered) {
            $user = $this->createNewUser($data, 'google_id');
        } else {
            $user->update(['google_id' => $data['id']]);
        }

        $response = [
            'user_id' => $user->id,
            'already_registered' => $isRegistered,
        ];

        if ($isRegistered) {
            $token = auth('api')->tokenById($user->id);
            $this->handlePostLogin($request, $token, $user);
            $response['token'] = $token;

            return apiResponse2(1, 'login', trans('api.auth.login'), $response);
        }

        return apiResponse2(1, 'registered', trans('api.auth.registered'), $response);
    }

    public function redirectToFacebook()
    {
        return Socialite::driver('facebook')->stateless()->redirect();
    }

    public function handleFacebookCallback(Request $request)
    {
        $this->validateRequest($request);

        $data = $request->all();
        $user = User::where('facebook_id', $data['id'])
            ->orWhere('email', $data['email'])
            ->first();

        $isRegistered = !empty($user);

        if (!$isRegistered) {
            $user = $this->createNewUser($data, 'facebook_id');
        } else {
            $user->update(['facebook_id' => $data['id']]);
        }

        $response = [
            'user_id' => $user->id,
            'already_registered' => $isRegistered,
        ];

        if ($isRegistered) {
            $token = auth('api')->tokenById($user->id);
            $this->handlePostLogin($request, $token, $user);
            $response['token'] = $token;

            return apiResponse2(1, 'login', trans('api.auth.login'), $response);
        }

        return apiResponse2(1, 'registered', trans('api.auth.registered'), $response);
    }

    private function validateRequest(Request $request)
    {
        validateParam($request->all(), [
            'email' => 'required|email',
            'name' => 'required',
            'id' => 'required'
        ]);
    }

    private function createNewUser(array $data, string $providerIdField): User
    {
        return User::create([
            'full_name' => $data['name'],
            'email' => $data['email'],
            $providerIdField => $data['id'],
            'role_id' => Role::getUserRoleId(),
            'role_name' => Role::$user,
            'status' => User::$active,
            'verified' => true,
            'created_at' => now(),
            'password' => null
        ]);
    }

    private function handlePostLogin(Request $request, $token, User $user)
    {
        UserFirebaseSessions::create([
            'user_id' => $user->id,
            'token' => $token,
            'ip' => $request->getClientIp(),
            'fcm_token' => $request->input('fcm_token', ''),
        ]);
    }
}
