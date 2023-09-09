<?php

namespace App\Http\Controllers;

use App\Models\User;

use Illuminate\Http\Request;
use Illuminate\Auth\Events\PasswordReset;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;

use Illuminate\Support\Facades\Routes;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Validator;


use Youtube;
use Illuminate\Support\Facades\Hash;

class StudentController extends Controller
{

    public function enrolled_courses(Request $request){
        $validator = Validator::make($request->all(), [
            'userid'=>'required'
           
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }
        $data = DB::table('enrolled_courses')->where('userid', $request->userid)->get();
        $courses = $data;

        // $get = DB::select('SELECT course_id FROM enrolled_courses WHERE userid = '.$request->userid);
                
        //             for($i=0;$i<count($get); $i++ ){
        //                 $array = json_decode(json_encode($get),true);
        //                 $course_id = $array[$i]['course_id'];
        //                 $course = DB::table('courses')->where('id', $course_id)->get();
        //                 $array1 = json_decode(json_encode($course),true);
        //                 foreach($course as $key => $new) {
        //                     return response()->json([
        //                   'data' => $new, 
                          
        //                   ]
        //               );  
        //             }
   
        //             }
                    // $arraylength = count($array);
                    // // echo $arraylength;
                    // // print_r($array[1]['course_id']);
                    // for($i=0;$i<$arraylength;$i++){
                        
                        
                    // }
                    
                    

                    
        if($data){
            return response([
                'Data' => $courses,
                'status' =>'success',
                
            ], 200);
        }
        else{
            return response([
                'message' => "not found ",
                'status' =>'failed',
                
            ], 422);

        }

    }


    // public function enrolled_courses_details(Request $request){
    //     $validator = Validator::make($request->all(), [
    //         'course_id'=>'required'
           
    //     ]);
    //     if ($validator->fails())
    //     {
    //         return response(['errors'=>$validator->errors()->all()], 422);
    //     }
    //     $data = DB::table('enrolled_courses')->where('userid', $request->userid)->get();
    //     $courses = $data;
                    
    //     if($data=!null){
    //         return response([
    //             'Data' => $courses,
    //             'status' =>'success',
                
    //         ], 200);
    //     }
    //     else{
    //         return response([
    //             'message' => "not found ",
    //             'status' =>'failed',
                
    //         ], 422);

    //     }

    // }


    
}
