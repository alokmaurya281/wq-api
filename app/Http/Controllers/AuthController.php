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

class AuthController extends Controller
{

    
    
    public function register(Request $request){
        $request->validate([
            'name'=>'required',
            'email'=>'required|email',
            'password'=>'required|min:6|confirmed',
            'password'=>'required',
        ]);
        if(User::where('email',$request->email)->first()){
            return response([
                'message' => 'Email exists',
                'status' =>'failed',
            ], 422
        );

        }
        $role_id = $request->role_id;
        if($role_id==1){
            $table = 'students';
        }
        else{
            $table = 'teachers';
        }

        $randomstr= Str::random(10);

        $user = User::create([
            'name'=>$request->name,
            'email'=>$request->email,
            'password'=>Hash::make($request->password),
            'role_id'=>$request->role_id,
            'remember_token' => $randomstr,

        ]);
       
        if($user==true){
            $getuserid =  DB::table('users')->where('email', $request->email)->value('id');

            $create = DB::table($table)->insert([
                'email'=>$request->email,
                'userid'=>$getuserid,
                'name'=>$request->name,
            ]);

        }
        $token = $user->createToken('Token')->accessToken;
        return response([
            'token'=>$token,
            'message' => 'Account Created successfully',
            'status' =>'success',

        ], 200
    );
      }


      public function login (Request $request) {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required|min:6',
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }
        $user = User::where('email', $request->email)->first();
        $role_id =  DB::table('users')->where('email', $request->email)->value('role_id');
        if($role_id==1){
            $type = 'students';
        }
        else{
            $type = 'teachers';
        }
        if ($user) {
            if (Hash::check($request->password, $user->password)) {
                $token = $user->createToken('token')->accessToken;
                $response = ['token' => $token,
                'status'=>"success",
                'type'=>$type,
            
            ];
                return response($response, 200);
            } else {
                $response = ["message" => "Password mismatch"];
                return response($response, 422);
            }
        } else {
            $response = ["message" =>'User does not exist'];
            return response($response, 422);

        }
    }


    public function logout (Request $request) {
        $token = $request->user()->token();
        $token->revoke();
        $response = ['message' => 'You have been successfully logged out!'];
        return response($response, 200);
    }


  public function forgot(Request $request){
    $validator = Validator::make($request->all(), [
        'email' => 'required|email',
    ]);

    if($user=User::where('email',$email=$request->email)->first()){
        $token = Str::random(10);

        DB::table('password_resets')->insert([
            'email'=>$email,
            'token'=>$token,
        ]);

        //send email

        Mail::send('<div ><a https://localhost/reset/{{$token}}">click</a></div>', ['token'=>$token], function(Message $token) use ($email){
            $message->to($email);
            $message->subject('Reset Your Password - WorldsQNA ');

        }
            


        );

        return response([
            'message' => 'Check Your Email',
            'status' =>'success',
        ], 200
    );
        
  }
  else{
    return response([
        'message' => 'Email does not exists',
        'status' =>'failed',
    ], 422
);

  }
 }



 public function get_user_id(Request $request){
    $validator = Validator::make($request->all(), [
        'email'=>'required',
        
    ]);
    if ($validator->fails())
    {
        return response(['errors'=>$validator->errors()->all()], 422);
    }


    $userid =  DB::table('users')->where('email', $request->email)->value('id');

    


    if($userid){
        return response([
            'userid' => $userid,
            'status' =>'success',
            
        ], 200);
    }



}

public function get_user_details(Request $request){
    $validator = Validator::make($request->all(), [
        'userid'=>'required',
        
    ]);
    if ($validator->fails())
    {
        return response(['errors'=>$validator->errors()->all()], 422);
    }

    $role_id =  DB::table('users')->where('id', $request->userid)->value('role_id');

    

    
    if($role_id){
        if($role_id==1){
            $table = "students";
        }
        else{
            $table = "teachers";
        }
        $data = DB::table($table)
        ->where('userid', $request->userid)
        ->get();

    }
    else{
        return response([
            'message' => "user id not exist",
            'status' =>'failed',
            
        ],422);

    }

    if($data){
        return response([
            'message' => $data,
            'status' =>'success',
            
        ], 200);
    }
    else{
        return response([
            'message' => "user not found",
            'status' =>'failed',
            
        ],422);

    }

}


public function get_course_user_details_rating(Request $request){
    $validator = Validator::make($request->all(), [
        'userid'=>'required',
        
    ]);
    if ($validator->fails())
    {
        return response(['errors'=>$validator->errors()->all()], 422);
    }

    $role_id =  DB::table('users')->where('id', $request->userid)->value('role_id');

    

    
    if($role_id){
        if($role_id==1){
            $table = "students";
        }
        else{
            $table = "teachers";
        }
        $data = DB::table($table)
        ->where('userid', $request->userid)
        ->get();

    }
    else{
        return response([
            'message' => "user id not exist",
            'status' =>'failed',
            
        ],422);

    }

    if($data){
        return response([
            'message' => $data,
            'status' =>'success',
            
        ], 200);
    }
    else{
        return response([
            'message' => "user not found",
            'status' =>'failed',
            
        ],422);

    }

}



public function update_profile(Request $request){
    $validator = Validator::make($request->all(), [
        'userid'=>'required',
        // 'role_id'=>'required'
        
    ]);
    if ($validator->fails())
    {
        return response(['errors'=>$validator->errors()->all()], 422);
    }
    $role_id = DB::table('users')->where('id', $request->userid)->value('role_id');
    if($role_id==1){
        $table = "students";
    }
    else{
        $table = "teachers";
    }
   
    
    $update = DB::table($table)->where('userid', $request->userid)->update([
        'name'=>$request->name,
        'phone'=>$request->phone,
        'dob'=>$request->dob,
        'address'=>$request->address,
        'pincode'=>$request->pincode,
        'state'=>$request->state,
        'city'=>$request->city,
        'country'=>$request->country,


   ]);
   
   $data = $request->all();
   if($update){
    $update1 = DB::table('users')->where('id', $request->userid)->update([
        'name'=>$request->name,
    
    ]);
    return response([
        'message'=>"Updated Successfully!",
        'status'=>"success",
        "data"=>$data
    ],200);

   }
   else{
    return response([
        'message'=>"Not Updated Please Try Again",
        'status'=>"failed"
    ],422);

   }




}
public function update_profile_image(Request $request){
    $validator = Validator::make($request->all(), [
        'userid'=>'required',
        // 'role_id'=>'required'
        
    ]);
    if ($validator->fails())
    {
        return response(['errors'=>$validator->errors()->all()], 422);
    }
    $role_id = DB::table('users')->where('id', $request->userid)->value('role_id');
    if($role_id==1){
        $table = "students";
    }
    else{
        $table = "teachers";
    }
    
    if ($file = $request->file('profile_image')) {
        $path = $file->store('files/profile_images');
        $name = $file->getClientOriginalName();
  
    }
    
    $update = DB::table($table)->where('userid', $request->userid)->update([
        
        'profile_image'=>$path,

   ]);
  
   $data = $request->all();
   if($update){
    return response([
        'message'=>"Updated Successfully!",
        'status'=>"success",
        "data"=>$data
    ],200);

   }
   else{
    return response([
        'message'=>"Not Updated Please Try Again",
        'status'=>"failed"
    ],422);

   }




}


public function change_password(Request $request){
    $validator = Validator::make($request->all(), [
        'userid'=>'required',
        'old_password'=>'required',
        'password'=>'required',
        
    ]);
    if ($validator->fails())
    {
        return response(['errors'=>$validator->errors()->all()], 422);
    }
   

    $old_password =  DB::table('users')->where('id', $request->userid)->value('password');
    if(Hash::check($request->old_password, $old_password))
    {
        $update = DB::table('users')->where('id', $request->userid)->update([
            'password'=>Hash::make($request->password),
    
       ]);
       return response([
        'message'=>"Password updated!",
        'status'=>"success",
        
    ],200);

       
    }
       else {
        return response([
            'message'=>"Password Not matched!",
            'status'=>"failed",
            
        ],422);
       

    }

   
}

        
}
