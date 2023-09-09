<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Auth\Events\PasswordReset;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;

use Illuminate\Support\Facades\Routes;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Validator;

use App\Models\User;
use Youtube;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class SearchController extends Controller
{

    public function searchforall(Request $request){
        if($request->userid) 
        {
            $userid = $request->userid;
        }
        else{
            $userid = "anonymous";
        }
        
        $keyword = $request->get('keyword');

        $search = DB::table('courses')->where('course_name', 'like', "%{$keyword}%")
                        ->orWhere('course_short_description', 'like', "%{$keyword}%")
                        ->orWhere('course_long_description', 'like', "%{$keyword}%")
                        ->orWhere('course_price', 'like', "%{$keyword}%")
                        ->orWhere('course_language', 'like', "%{$keyword}%")
                        ->orWhere('level_of_course', 'like', "%{$keyword}%")
                        ->orWhere('category_id', 'like', "%{$keyword}%")
                        ->orWhere('course_motive_id', 'like', "%{$keyword}%")
                        ->orWhere('course_material_id', 'like', "%{$keyword}%")
                        ->orWhere('total_lectures', 'like', "%{$keyword}%")
                        ->orWhere('total_hours_lectures', 'like', "%{$keyword}%")
                        ->orWhere('course_aim_id', 'like', "%{$keyword}%")
                        ->orWhere('course_requirement_id', 'like', "%{$keyword}%")
                        ->orWhere('course_saved_in', 'like', "%{$keyword}%")
                        ->orWhere('is_published', 'like', "%{$keyword}%")
                        ->orWhere('status', 'like', "%{$keyword}%")
                        ->orWhere('total_enrolled_students', 'like', "%{$keyword}%")
                        ->orWhere('created_at', 'like', "%{$keyword}%")
                        ->orWhere('updated_at', 'like', "%{$keyword}%")
                        ->orWhere('teacher_id', 'like', "%{$keyword}%")
                        ->orWhere('id', 'like', "%{$keyword}%")
                        ->orWhere('course_welcome_message', 'like', "%{$keyword}%")
                        ->orWhere('course_complete_message', 'like', "%{$keyword}%")

                        ->get();

                        if($search){

                            $insert = DB::table('searches')->insert([
                                'userid'=>$userid,
                                'keyword'=>$request->keyword,
                                
                    
                            ]);
                            return response([
                                'search' => $search,
                                'status' =>'success',
                                
                            ], 200);
                        }
                       

    }
 


    public function search_by_id(Request $request){
        $keyword = $request->get('keyword');
        if($request->userid) 
        {
            $userid = $request->userid;
        }
        else{
            $userid = "anonymous";
        }
        

        $search = DB::table('courses')->where('id', $keyword)
                        ->get();

                        if($search){
                            $insert = DB::table('searches')->insert([
                                'userid'=>$userid,
                                'keyword'=>$request->keyword,
                                
                    
                            ]);
                            return response([
                                'search' => $search,
                                'status' =>'success',
                                
                            ], 200);
                        }
                       

    }


    public function search_by_course_status(Request $request){
        $keyword = $request->get('keyword');
        // if($request->userid) 
        // {
        //     $userid = $request->userid;
        // }
        // else{
        //     $userid = "anonymous";
        // }
        

        $search = DB::table('courses')->where('status', 'like', "%{$keyword}%")
                        ->orWhere('course_saved_in', 'like', "%{$keyword}%")
                        ->orWhere('is_published', 'like', "%{$keyword}%")
                        ->get();

                        if($search){
                            // $insert = DB::table('searches')->insert([
                            //     'userid'=>$userid,
                            //     'keyword'=>$request->keyword,
                                
                    
                            // ]);
                            return response([
                                'search' => $search,
                                'status' =>'success',
                                
                            ], 200);
                        }
                       

    }
    public function search_by_course_category(Request $request){
        $keyword = $request->get('keyword');
        if($request->userid) 
        {
            $userid = $request->userid;
        }
        else{
            $userid = "anonymous";
        }
        

        $category_id  =   DB::table('course_categories')->where('category_name', $request->keyword)->value('id');

        $search = DB::table('courses')->where('category_id', 'like', "%{$category_id}%")
                        ->get();

                        if($search){
                            $insert = DB::table('searches')->insert([
                                'userid'=>$userid,
                                'keyword'=>$request->keyword,
                                
                    
                            ]);
                            return response([
                                'search' => $search,
                                'status' =>'success',
                                
                            ], 200);
                        }
                       

    }

    public function search_by_teacher_id(Request $request){
        $keyword = $request->get('keyword');
        if($request->userid) 
        // {
        //     $userid = $request->userid;
        // }
        // else{
        //     $userid = "anonymous";
        // }
        
        

        $search = DB::table('courses')->where('teacher_id', 'like', "%{$keyword}%")
                        ->get();

                        if($search){
                            // $insert = DB::table('searches')->insert([
                            //     'userid'=>$userid,
                            //     'keyword'=>$request->keyword,
                                
                    
                            // ]);
                            return response([
                                'search' => $search,
                                'status' =>'success',
                                
                            ], 200);
                        }
                       

    }

    // public function search_by_course_rating(Request $request){
    //     $keyword = $request->get('keyword');

    //     $data = DB::table('course_ratings')
    //     ->where('course_id', $request->keyword)
    //     ->Round(avg('rating'),2);

        

    //     $search = DB::table('courses')->where('teacher_id', 'like', "%{$keyword}%")
    //                     ->get();

    //                     if($search){
    //                         return response([
    //                             'search' => $search,
    //                             'status' =>'success',
                                
    //                         ], 200);
    //                     }
                       

    // }
 
        
}

