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

class TeacherController extends Controller
{
    public function get_course_teacher_details(Request $request){
        $validator = Validator::make($request->all(), [
            'course_id'=>'required',
            
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }


        $teacher_id =  DB::table('courses')->where('id', $request->course_id)->value('teacher_id');

        $data = DB::table('teachers')
        ->where('id', $teacher_id)
        ->get();
        

        $c = DB::select("SELECT count(*) as total FROM courses WHERE teacher_id = $teacher_id ");

        if($data){
            return response([
                'Data' => $data,
                'total_courses'=>$c,
                'teacher_id'=>$teacher_id,
                'status' =>'success',
                
            ], 200);
        }

    


    }


    public function get_teacher_details(Request $request){
        $validator = Validator::make($request->all(), [
            'userid'=>'required',
            
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }


        $teacher_id =  DB::table('teachers')->where('userid', $request->userid)->value('id');

        $data = DB::table('teachers')
        ->where('id', $teacher_id)
        ->get();
        

        $c = DB::select("SELECT count(*) as total FROM courses WHERE teacher_id = $teacher_id ");

        if($data){
            return response([
                'Data' => $data,
                'total_courses'=>$c,
                'teacher_id'=>$teacher_id,
                'status' =>'success',
                
            ], 200);
        }

    

    }

 
}

