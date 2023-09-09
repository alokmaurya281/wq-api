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
use Illuminate\Support\Facades\Hash;

class CoursePurchaseController extends Controller
{
    public function add_cart(Request $request){
        $validator = Validator::make($request->all(), [
            'course_id'=>'required',
            'userid'=>'required',
           
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }
        if(DB::table('user_cart')->where(['userid'=>$request->userid,
        'course_id'=>$request->course_id])
        ->first()){
            return response([
                'message' => 'Course already Added',
                'status' =>'success',
            ], 200
        );

        }
        else{
            $data = DB::table('user_cart')->insertGetId([
                'course_id'=>$request->course_id,
                'userid'=>$request->userid,
                'cart_quantity'=>$request->cart_quantity,
                'item_price'=>$request->item_price,
                
            ]);
            $cart_id=$data;
            if($data=!null){
                return response([
                    'message' => "Successfully Added to cart.",
                    'status' =>'success',
                    'cart_id'=>$cart_id,
                    
                ], 200);
            }
            else{
                return response([
                    'message' => "Error adding to cart.",
                    'status' =>'failed',
                    
                ], 422);
    
            }
    

        }
        
    }

    public function get_cart_item_by_cart_id(Request $request){
        $validator = Validator::make($request->all(), [
            'cart_id'=>'required'
           
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }
        $data = DB::table('user_cart')->where('id', $request->cart_id)->get();
        $cart_item = $data;
        
        if($data=!null){
            return response([
                'Data' => $cart_item,
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



    public function get_cart_item_by_userid(Request $request){
        $validator = Validator::make($request->all(), [
            'userid'=>'required'
           
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }
        $data = DB::table('user_cart')->where('userid', $request->userid)->get();
        $cart_item = $data;
        
        if($data=!null){
            return response([
                'Data' => $cart_item,
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


    public function delete_cart_item(Request $request){
        $validator = Validator::make($request->all(), [
            'cart_id'=>'required'
           
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }
        $data = DB::table('user_cart')->where('id', $request->cart_id)->delete();
        $cart_item = $data;
        
        if($data){
            return response([
                'message' => "Deleted",
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







    public function buy_now(Request $request){
        $validator = Validator::make($request->all(), [
            // 'course_id'=>'required',
            'userid'=>'required',
           
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }
        $data = DB::table('purchase_summary')->insertGetId([
            // 'course_id'=>$request->course_id,
            'userid'=>$request->userid,
            'course_id'=>$request->course_id,
            'final_price'=>$request->final_price,
            'item_price'=>$request->item_price,
            'coupan_applied'=>$request->coupan,
            'payment_method'=>$request->payment_method,
            
        ]);
        $purchase_id=$data;

        if($data=!null){

            $delete = DB::table('user_cart')->where('id', $request->cart_id)->delete();
            return response([
                'message' => "Successfully Purchased .",
                'status' =>'success',
                'purchase_id'=>$purchase_id,
                
            ], 200);

        }
        else{
            return response([
                'message' => "Error .",
                'status' =>'failed',
                
            ], 422);

        }

    }


    public function create_coupan(Request $request){
        $validator = Validator::make($request->all(), [
            // 'course_id'=>'required',
            // 'userid'=>'required',
           
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }
        $data = DB::table('coupans')->insertGetId([
            // 'course_id'=>$request->course_id,
            'coupan'=>$request->coupan,
            'discount_amount'=>$request->discount_amount,
            'expiry_date'=>$request->expiry_date,
            
        ]);
        $purchase_id=$data;

        if($data=!null){

            
            return response([
                'message' => "Successfully added .",
                'status' =>'success',
                'coupan_id'=>$purchase_id,
                
            ], 200);

        }
        else{
            return response([
                'message' => "Error .",
                'status' =>'failed',
                
            ], 422);

        }

    }


    public function get_coupan(Request $request){
        $validator = Validator::make($request->all(), [
            'coupan'=>'required'
           
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }
        $data = DB::table('coupans')->where('coupan', $request->coupan)->get();
        $cart_item = $data;
        
        if($data=!null){
            return response([
                'Data' => $cart_item,
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


    public function update_purchase_status(Request $request){
        $validator = Validator::make($request->all(), [
            'purchase_id'=>'required',
            'transaction_id'=>'required',
           
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }
        $data = DB::table('purchase_summary')->where('id', $request->purchase_id)->update([
            'transaction_id'=>$request->transaction_id,
            'status'=>$request->status,
            
        ]);
        

        if($data=!null){

            $course_id =  DB::table('purchase_summary')->where('id', $request->purchase_id)->value('course_id');
            $userid =  DB::table('purchase_summary')->where('id', $request->purchase_id)->value('userid');
            $enrolled_stu =  DB::table('courses')->where('id', $course_id)->value('total_enrolled_students');
            $new_enrolled_stu = $enrolled_stu+1;
            

            $update = DB::table('courses')->where('id',$course_id)->update(['total_enrolled_students'=>$new_enrolled_stu]);
            $insert = DB::table('enrolled_courses')->insert([
                'course_id'=>$course_id,
                'userid'=>$userid,

            ]);
            $insert = DB::table('student_course_progress')->insert([
                'course_id'=>$course_id,
                'userid'=>$userid,

            ]);

            return response([
                'message' => "Successfully Purchased .",
                'status' =>'success',
                
                
            ], 200);

        }
        else{
            return response([
                'message' => "Error .",
                'status' =>'failed',
                
            ], 422);

        }

    }


    public function get_purchase_summary(Request $request){
        $validator = Validator::make($request->all(), [
            'purchase_id'=>'required'
           
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }
        $data = DB::table('purchase_summary')->where('id', $request->purchase_id)->get();
        $purchase_item = $data;
        
        if($data=!null){
            return response([
                'Data' => $purchase_item,
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










}