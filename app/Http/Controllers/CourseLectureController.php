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

class CourseLectureController extends Controller
{

    public function add_course_lecture(Request $request){
        $validator = Validator::make($request->all(), [
            'course_id' => 'required',

        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }


        if ($file = $request->file('material_file')) {
            $path = $file->store('files/course_materials');
            $name = $file->getClientOriginalName();
 
           
        }

        $create = DB::table('course_materials')->insert([
            'course_id'=>$request->course_id,
            

        ]);
        $data = $request->all(); 

        

        
        if($create){
            return response([
                'message' => 'Course Lecture Added successfully',
                'status' =>'success',
                'Data'=>$data,
            ], 200
        );
        }

    }
   


 
}

