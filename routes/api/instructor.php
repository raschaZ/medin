<?php

use App\Http\Controllers\Api\Instructor\BundleController;
use App\Http\Controllers\Api\Instructor\BundleWebinarController;
use App\Http\Controllers\Api\Instructor\CertificateRequestController;
use App\Http\Controllers\Api\Instructor\TeachersCertificatesController;
use Illuminate\Support\Facades\Route;

Route::group([], function () {


    /***** bundles *****/
    Route::get('bundles/{bundle}/export', ['uses' => 'BundleController@export'])->middleware('api.level-access:teacher');
    Route::apiResource('bundles', BundleController::class)->middleware('api.level-access:teacher');
    Route::apiResource('bundles.webinars', BundleWebinarController::class)->middleware('api.level-access:teacher')->only(['index']);

    Route::group(['prefix' => 'certificates/teachers-certificates'], function () {
        Route::get('/{webinarId}', [TeachersCertificatesController::class, 'index']);
        Route::post('/', [TeachersCertificatesController::class, 'store']);
        Route::get('/{id}', [TeachersCertificatesController::class, 'show']);
        Route::put('/{id}', [TeachersCertificatesController::class, 'update']);
        Route::delete('/{webinarId}/teacher/{teacherId}', [TeachersCertificatesController::class, 'removeTeacher']);
        Route::group(['prefix' => 'send-to-admin'], function () {
            Route::post('/', [CertificateRequestController::class, 'store']); 
        });
    });

    Route::group(['prefix' => 'webinar'], function () {
        Route::post('/', ['uses' => 'WebinarsController@storeAll']);

    });

    Route::group(['prefix' => 'quizzes'], function () {
        Route::get('/list', ['uses' => 'QuizzesController@results']);
        Route::post('/', ['uses' => 'QuizzesController@store']);
        Route::put('/{id}', ['uses' => 'QuizzesController@update']);
        Route::delete('/{id}', ['uses' => 'QuizzesController@destroy']);

    });
//  Route::get('sales', ['uses' => 'SalesController@list']);
    Route::group(['prefix' => 'meetings'], function () {
        Route::get('/', function () {
            dd('ff');
        });

        Route::get('/requests', ['uses' => 'ReserveMeetingController@requests']);
        Route::post('/create-link', ['uses' => 'ReserveMeetingController@createLink']);
        Route::post('/{id}/finish', ['uses' => 'ReserveMeetingController@finish']);
        Route::post('/{id}/add-session', 'ReserveMeetingController@addLiveSession');

    });
    Route::group(['prefix' => 'comments'], function () {
        Route::get('/', ['uses' => 'CommentsController@myClassComments']);
        Route::post('/{id}/reply', ['uses' => 'CommentsController@reply']);
    });
    Route::group(['prefix' => 'assignments'], function () {
        Route::get('/{assignment}/students', ['uses' => 'AssignmentController@submmision']);
        Route::get('/students', ['uses' => 'AssignmentController@students']);
        Route::get('/', ['uses' => 'AssignmentController@index']);
        Route::post('/histories/{assignment_history}/rate', ['uses' => 'AssignmentController@setGrade']);
    });


});





