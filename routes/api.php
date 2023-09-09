<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::group(['prefix'=>'v1', 'namespace'=>'App\Http\Controllers'],function(){
    Route::post('auth/register', 'AuthController@register');
    Route::post('auth/login', 'AuthController@login');
    Route::post('auth/forgot-password', 'AuthController@forgot');
    Route::get('courses', 'CourseController@get_courses');
    Route::post('course-aim', 'CourseController@get_course_aim_by_course_id');
    Route::post('course-motive', 'CourseController@get_course_motive_by_course_id');
    Route::post('course-requirements', 'CourseController@get_course_requirements_by_course_id');
    Route::post('get-course-by-teacher-id', 'CourseController@get_course_by_teacher_id');
    Route::post('get-course-by-course-id', 'CourseController@get_course_by_course_id');
    Route::post('get-course-by-course-id-published', 'CourseController@get_course_by_course_id_published');
    Route::post('get-course-section-by-course-id', 'CourseController@get_course_section');

    Route::get('categories', 'CourseController@get_categories');
    Route::post('categories-by-id', 'CourseController@get_categories_by_id');
    Route::post('add-category', 'CourseController@create_category');
    
    Route::post('course-faqs', 'CourseController@get_course_faqs');
    Route::post('avg-course-ratings', 'CourseRatingController@get_course_avg_rating');
    Route::post('course-ratings', 'CourseRatingController@get_course_rating');
    Route::post('course-ratings-all', 'CourseRatingController@get_course_rating_all');
    Route::post('get-course-teacher-details', 'TeacherController@get_course_teacher_details');
    Route::post('get-user-details-rating', 'AuthController@get_course_user_details_rating');
    Route::post('get-course-content', 'CourseController@get_course_content');
    // Route::post('upload-image', 'CourseController@upload_image');


    Route::post('search-for-all', 'SearchController@searchforall');
    Route::post('search-by-id', 'SearchController@search_by_id');
    Route::post('search-by-status', 'SearchController@search_by_course_status');
    Route::post('search-by-category', 'SearchController@search_by_course_category');
    Route::post('search-by-teacher_id', 'SearchController@search_by_teacher_id');


    Route::post('upload-video', 'YoutubeController@upload_video');

    
    


    // protected routes

    Route::middleware('auth:api')->post('auth/logout', 'AuthController@logout');
    Route::middleware('auth:api')->post('get-user-id', 'AuthController@get_user_id');
    Route::middleware('auth:api')->post('get-user-details', 'AuthController@get_user_details');
    Route::middleware('auth:api')->post('update-profile', 'AuthController@update_profile');
    Route::middleware('auth:api')->post('update-profile-image', 'AuthController@update_profile_image');
    Route::middleware('auth:api')->post('change-password', 'AuthController@change_password');
    Route::middleware('auth:api')->post('get-teacher-details', 'TeacherController@get_teacher_details');

    
    Route::middleware('auth:api')->post('create-course', 'CourseController@CreateCourse');
    Route::middleware('auth:api')->post('update-course-deatils-first', 'CourseController@course_update_first');
    Route::middleware('auth:api')->post('setup-video-deatils-add', 'CourseController@course_setup_video_details');
    Route::middleware('auth:api')->post('upload-setup-video', 'CourseController@upload_setup_video');
    Route::middleware('auth:api')->post('get-setup-video', 'CourseController@get_setup_video_details');
    Route::middleware('auth:api')->post('setup-video-submit-for-review', 'CourseController@setup_video_request');
    Route::middleware('auth:api')->post('update-setup-video-status', 'CourseController@update_setup_video_status');

    Route::middleware('auth:api')->post('add-section', 'CourseController@create_course_section');
    Route::middleware('auth:api')->post('get-section', 'CourseController@get_course_section');
    Route::middleware('auth:api')->post('get-course-progress', 'CourseController@course_progress');
    Route::middleware('auth:api')->post('get-section-by-id', 'CourseController@get_course_section_by_id');
    Route::middleware('auth:api')->post('update-section', 'CourseController@update_course_section');
    Route::middleware('auth:api')->post('add-course-lecture', 'CourseController@course_lecture_content');
    Route::middleware('auth:api')->post('add-lecture-assignment', 'CourseController@add_assignments');
    Route::middleware('auth:api')->post('add-course-project', 'CourseController@add_course_project');
    Route::middleware('auth:api')->post('update-course-landing-page', 'CourseController@update_course_landing_page');
    Route::middleware('auth:api')->post('update-course-status', 'CourseController@update_course_status');
    Route::middleware('auth:api')->post('course-final-submit', 'CourseController@course_final_submit');
    Route::middleware('auth:api')->get('get-course-requests', 'CourseController@get_course_requests');
    Route::middleware('auth:api')->post('update-course-requests', 'CourseController@update_course_requests');

    
    Route::middleware('auth:api')->post('get-course-materials', 'CourseController@get_course_material');
    Route::middleware('auth:api')->post('get-course-materials-by-course-id', 'CourseController@get_course_material_by_course_id');
    Route::middleware('auth:api')->post('get-course-materials-by-lecture-id', 'CourseController@get_course_material_by_lecture_id');
    Route::middleware('auth:api')->post('get-course-lectures', 'CourseController@get_course_lecture');
    Route::middleware('auth:api')->post('get-course-lectures-by-course-id', 'CourseController@get_course_lecture_by_course_id');
    Route::middleware('auth:api')->post('get-course-lectures-by-id', 'CourseController@get_course_lecture_by_id');
    Route::middleware('auth:api')->post('get-course-lectures-by-course-id-and-section-id', 'CourseController@get_course_lecture_by_course_id_section_id');
    Route::middleware('auth:api')->post('get-course-assignments', 'CourseController@get_course_assignments');

    Route::middleware('auth:api')->post('get-course-assignments-by-lecture-id', 'CourseController@get_course_assignmentby_lecture_id');
    Route::middleware('auth:api')->post('get-course-projects', 'CourseController@get_course_projects');

    Route::middleware('auth:api')->post('get-course-projects-by-lecture-id', 'CourseController@get_course_assignmentby_lecture_id');


    Route::middleware('auth:api')->post('delete-course-lecture', 'CourseController@delete_course_lecture');
    Route::middleware('auth:api')->post('update-course-image', 'CourseController@update_course_image');
    Route::middleware('auth:api')->post('add-course-rating', 'CourseRatingController@create_course_rating');
    Route::middleware('auth:api')->post('update-status-course-rating', 'CourseRatingController@update_course_rating_status');
    Route::middleware('auth:api')->post('delete-course-rating', 'CourseRatingController@delete_course_rating');


    Route::middleware('auth:api')->post('delete-category', 'CourseController@delete_category');
    Route::middleware('auth:api')->post('update-category', 'CourseController@update_category');
    Route::middleware('auth:api')->post('update-category-image', 'CourseController@update_category_image');
    
    Route::middleware('auth:api')->post('add-course-faqs', 'CourseController@create_course_faqs');
    Route::middleware('auth:api')->post('delete-course-faqs', 'CourseController@delete_course_faqs');
    Route::middleware('auth:api')->post('update-course-faqs', 'CourseController@update_course_faqs');

    Route::middleware('auth:api')->post('add-course-content', 'CourseController@create_course_content');
    Route::middleware('auth:api')->post('update-course-content', 'CourseController@update_course_content');
    Route::middleware('auth:api')->post('delete-course-content', 'CourseController@delete_course_content');

    Route::middleware('auth:api')->post('upload-course-lecture-video', 'YoutubeController@upload_course_lecture_video');


    Route::middleware('auth:api')->post('add-to-cart', 'CoursePurchaseController@add_cart');
    Route::middleware('auth:api')->post('get-cart-item-by-cart-id', 'CoursePurchaseController@get_cart_item_by_cart_id');
    Route::middleware('auth:api')->post('get-cart-item-by-userid', 'CoursePurchaseController@get_cart_item_by_userid');
    Route::middleware('auth:api')->post('delete-cart-item', 'CoursePurchaseController@delete_cart_item');
    Route::middleware('auth:api')->post('buy-now', 'CoursePurchaseController@buy_now');
    Route::middleware('auth:api')->post('create-coupan', 'CoursePurchaseController@create_coupan');
    Route::middleware('auth:api')->post('get-coupan', 'CoursePurchaseController@get_coupan');
    Route::middleware('auth:api')->post('update-purchase-status', 'CoursePurchaseController@update_purchase_status');
    Route::middleware('auth:api')->post('get-purchase-summary', 'CoursePurchaseController@get_purchase_summary');


    Route::middleware('auth:api')->post('enrolled-courses', 'StudentController@enrolled_courses');
    Route::middleware('auth:api')->post('enrolled-courses-details', 'StudentController@enrolled_courses_details');
    
});
