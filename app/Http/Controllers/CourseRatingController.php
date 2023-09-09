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
use Illuminate\Support\Facades\Hash;

class CourseRatingController extends Controller
{
    public function create_course_rating(Request $request){
        $validator = Validator::make($request->all(), [
            'course_id'=>'required',
            'student_id'=>'required',
            'userid'=>'required',
            'comment'=>'required',
            'rating'=>'required',
            'name'=>'required',
            
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }

        
        $create = DB::table('course_ratings')->insert([
            'course_id'=>$request->course_id,
            'student_id'=>$request->student_id,
            'userid'=>$request->userid,
            'comment'=>$request->comment,
            'rating'=>$request->rating,
            'name'=>$request->name,
            

        ]);
        if($create){
            return response([
                'message' => 'Feedback Added',
                'status' =>'success',
                
            ], 200);

        }


    }


    
    public function get_course_rating(Request $request){
        $validator = Validator::make($request->all(), [
            'course_id'=>'required',
            
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }


        $data = DB::table('course_ratings')
        ->where(['course_id'=> $request->course_id ,
        'status'=>'Approved'
        ])
        ->get();

        if($data){
            return response([
                'Data' => $data,
                'status' =>'success',
                
            ], 200);
        }

    }

    public function get_course_rating_all(Request $request){
        $validator = Validator::make($request->all(), [
            'course_id'=>'required',
            
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }


        $data = DB::table('course_ratings')
        ->where('course_id', $request->course_id)
        ->get();

        if($data){
            return response([
                'Data' => $data,
                'status' =>'success',
                
            ], 200);
        }

    }


    public function get_course_avg_rating(Request $request){
        $validator = Validator::make($request->all(), [
            'course_id'=>'required',
            
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }


        $data = DB::select("SELECT ROUND(AVG(`rating`),2) FROM `course_ratings` WHERE `course_id`=".$request->course_id);
        $t_feedback = DB::select("SELECT COUNT(*) FROM `course_ratings` WHERE `course_id`=".$request->course_id);

        if($data){
            return response([
                'Data' => $data,
                'total_feedback'=>$t_feedback,
                'status' =>'success',
                
            ], 200);
        }

    }

    public function delete_course_rating(Request $request){
        $validator = Validator::make($request->all(), [
            'course_rating_id'=>'required',
            
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }


        $data = DB::table('course_ratings')->where('id', $request->course_rating_id)->delete();

        if($data){
            return response([
                'message' => 'Course Rating Deleted',
                'status' =>'success',
                
            ], 200);
        }

    }

    public function update_course_rating_status(Request $request){
        $validator = Validator::make($request->all(), [
            'course_rating_id'=>'required',
            
            
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }



        $data = DB::table('course_ratings')->where('id', $request->course_rating_id)->update([
            'status'=>$request->status,
            
        ]);

        if($data){
            return response([
                'message' => 'Course Rating Status updated',
                'status' =>'success',
                
            ], 200);

        }
        else{
            return response([
                'message' => 'not updated',
                'status' =>'failed',
                
            ], 422);
        }

    }


 
}

