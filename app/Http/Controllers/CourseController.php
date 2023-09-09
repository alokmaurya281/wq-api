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
use core_completion\progress;

class CourseController extends Controller
{

    public function course_progress(Request $request){
        $course_id = $request->course_id;
        $data = DB::table('course_lectures')
        ->where('course_id', $request->course_id)
        ->get();

        $total = count($data);

        $completed = DB::table('completed_lectures')
        ->where('course_id', $request->course_id)
        ->get();
        $completed_l = count($completed);
        $progress = $completed_l/$total;


        if($data){
            return response([
                'Data' => $data,
                'status' =>'success',
                'total'=>$total,
                'completed'=>$completed,
                'completed_lectures'=>$completed_l,
                'progress'=>$progress.'%',
                
            ], 200);
        }
     

    }

    public function mark_as_completed(Request $request){
        $lecture_id = $request->lecture_id;
        $course_id = $request->course_id;
        $userid = $request->userid;


        $mark = DB::table('completed_lectures')->insert([
            'course_id'=>$request->course_id,
            'lecture_id'=>$lecture_id,


        ]);
        if($mark){

            $update = DB::table('student_course_progress')->where->insertGetId([
                'course_id'=>$request->course_id,
                'userid'=>$userid,

            ]);
            if($update=!null){

                $attended = DB::table('student_course_progress')
                ->where('course_id', $request->course_id)
                ->value('attended_lectures');

                $update1 = DB::table('student_course_progress')->where('id',$update)->update([
                    'attended_lectures'=> $attended+1,
    
                ]);

            }

        }

    }

    public function get_courses(){
        $data = DB::table('courses')->get();

        if($data){
            return response([
                'Data' => $data,
                'status' =>'success',
                
            ], 200);
        }

    }


    public function get_course_by_teacher_id(Request $request){
        $data = DB::table('courses')
        ->where('teacher_id', $request->teacher_id)
        ->get();

        if($data){
            return response([
                'Data' => $data,
                'status' =>'success',
                
            ], 200);
        }
        else{
            return response([
                'Data' => "not found",
                'status' =>'failed',
                
            ], 422);

        }

    }

    public function get_course_by_course_id(Request $request){
        $data = DB::table('courses')
        ->where('id', $request->course_id)
        ->get();

        if($data){
            return response([
                'Data' => $data,
                'status' =>'success',
                
            ], 200);
        }
        else{
            return response([
                'Data' => "not found",
                'status' =>'failed',
                
            ], 422);

        }

    }

    public function get_course_by_course_id_published(Request $request){
        $data = DB::table('courses')
        ->where(
            ['id', $request->course_id,
            'is_published','0',
            ]
            )
        ->get();

        if($data){
            return response([
                'Data' => $data,
                'status' =>'success',
                
            ], 200);
        }
        else{
            return response([
                'Data' => "not found",
                'status' =>'failed',
                
            ], 422);

        }

    }


    public function get_course_section(Request $request){
        $data = DB::table('course_sections')
        ->where('course_id', $request->course_id)
        ->get();

        if($data){
            return response([
                'Data' => $data,
                'status' =>'success',
                
            ], 200);
        }
        else{
            return response([
                'Data' => "not found",
                'status' =>'failed',
                
            ], 422);

        }

    }
    public function get_course_section_by_id(Request $request){
        $data = DB::table('course_sections')
        ->where('id', $request->section_id)
        ->get();

        if($data){
            return response([
                'Data' => $data,
                'status' =>'success',
                
            ], 200);
        }
        else{
            return response([
                'Data' => "not found",
                'status' =>'failed',
                
            ], 422);

        }

    }





    public function get_course_material(){
        $data = DB::table('course_materials')->get();

        if($data){
            return response([
                'Data' => $data,
                'status' =>'success',
                
            ], 200);
        }

    }


    public function get_course_lecture(){
        $data = DB::table('course_lectures')->get();

        if($data){
            return response([
                'Data' => $data,
                'status' =>'success',
                
            ], 200);
        }

    }

    public function get_course_lecture_by_course_id(Request $request){
        $data = DB::table('course_lectures')->where('course_id',$request->course_id)->get();

        if(!($data==NULL)){
            return response([
                'Data' => $data,
                'status' =>'success',
                
            ], 200);
        }
        else{
            return response([
                'Data' => "Not found",
                'status' =>'failed',
 
                
            ], 422);

        }

    }
    public function get_course_lecture_by_id(Request $request){
        $data = DB::table('course_lectures')->where('id',$request->lecture_id)->get();

        if(!($data==NULL)){
            return response([
                'Data' => $data,
                'status' =>'success',
                
            ], 200);
        }
        else{
            return response([
                'Data' => "Not found",
                'status' =>'failed',
 
                
            ], 422);

        }

    }
    public function get_course_lecture_by_course_id_section_id(Request $request){
        $data = DB::table('course_lectures')
        ->where(['course_id'=>$request->course_id,
        'section_id'=>$request->section_id,
        ])
        ->get();

        if(!($data==NULL)){
            return response([
                'Data' => $data,
                'status' =>'success',
                
            ], 200);
        }
        else{
            return response([
                'Data' => "Not found",
                'status' =>'failed',
 
                
            ], 422);

        }

    }
    public function get_course_material_by_course_id(Request $request){
        $data = DB::table('course_materials')->where('course_id',$request->course_id)->get();

        if($data){
            return response([
                'Data' => $data,
                'status' =>'success',
                
            ], 200);
        }

    }

    public function get_course_material_by_lecture_id(Request $request){
        $data = DB::table('course_materials')->where('course_lecture_id',$request->lecture_id)->get();

        if($data){
            return response([
                'Data' => $data,
                'status' =>'success',
                
            ], 200);
        }

    }

    public function get_course_assignmentby_lecture_id(Request $request){

        $assignment_id = DB::table('course_assignments')->where('lecture_id', $request->lecture_id)->value('id');
        $data = DB::table('course_assignments_ques_ans')->where('assignment_id', $assignment_id)->get();
        // $options = DB::table('course_assignments_question_options')->where('assignment_id', $assignment_id)->get();

        if($data){
            return response([
                'Data' => $data,
                'assignment_id'=>$assignment_id,
                'status' =>'success',
                
            ], 200);
        }

    }

    public function get_course_assignments(Request $request){

        // $assignment_id = DB::table('course_assignments')->where('lecture_id', $request->lecture_id)->value('id');
        $data1 = DB::table('course_assignments')->get();
        $data = DB::table('course_assignments_ques_ans')->get();
        $options = DB::table('course_assignments_question_options')->get();

        if($data){
            return response([
                'Data' => array('assignments'=>$data1,'assignment_ques_ans'=>$data,'assignment_option'=>$options),
                'status' =>'success',
                
            ], 200);
        }

    }


    public function get_course_projects(Request $request){

       
        


        $data = DB::table('course_projects')->get();
        
        if($data){
            return response([
                'Data' => $data,
                'status' =>'success',
                
            ], 200);
        }

    }
    public function get_course_projects_by_course_id(Request $request){

       
        
        $data = DB::table('course_projects')->where('course_id', $request->course_id)->get();
        
        if($data){
            return response([
                'Data' => $data,
                'status' =>'success',
                
            ], 200);
        }

    }
    public function get_course_aim_by_course_id(Request $request){

       
        
        $data = DB::table('course_aim')->where('course_id', $request->course_id)->get();
        
        if($data){
            return response([
                'Data' => $data,
                'status' =>'success',
                
            ], 200);
        }

    }
    public function get_course_motive_by_course_id(Request $request){

       
        
        $data = DB::table('course_motive')->where('course_id', $request->course_id)->get();
        
        if($data){
            return response([
                'Data' => $data,
                'status' =>'success',
                
            ], 200);
        }

    }
    public function get_course_requirements_by_course_id(Request $request){

       
        
        $data = DB::table('course_requirements')->where('course_id', $request->course_id)->get();
        
        if($data){
            return response([
                'Data' => $data,
                'status' =>'success',
                
            ], 200);
        }

    }


    public function update_course_status(Request $request){
        $validator = Validator::make($request->all(), [
            'course_id'=>'required',
            'status'=>'required',
           
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }

        if($request->status=="Approved"){
            $is_published = "1";
            $course_saved_in = "Published";
        }
        else{
            $is_published = "0";
            $course_saved_in = "Draft";
        }
        


        $data = DB::table('courses')->where('id', $request->course_id)->update([
            'status'=>$request->status,
            'is_published'=>$is_published,
            'course_saved_in'=>$course_saved_in,
            // 'category_image'=>$path,
        ]);

        if($data){
            return response([
                'message' => 'course status  updated',
                'status' =>'success',
                
            ], 200);

        }
        else{
            return response([
                'message' => 'course status not updated',
                'status' =>'failed',
                
            ], 422);
        }

    }

    public function get_categories(){
        $data = DB::table('course_categories')->get();

        if($data){
            return response([
                'Data' => $data,
                'status' =>'success',
                
            ], 200);
        }

    }

    public function get_categories_by_id(Request $request){
        $data = DB::table('course_categories')->where('id', $request->category_id)->get();

        if($data){
            return response([
                'Data' => $data,
                'status' =>'success',
                
            ], 200);
        }

    }

    public function delete_category(Request $request){
        $validator = Validator::make($request->all(), [
            'category_id'=>'required',
            
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }


        $data = DB::table('course_categories')->where('id', $request->category_id)->delete();

        if($data){
            return response([
                'message' => 'Category Deleted',
                'status' =>'success',
                
            ], 200);
        }

    }

    public function update_category(Request $request){
        $validator = Validator::make($request->all(), [
            'category_id'=>'required',
           
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }

        


        $data = DB::table('course_categories')->where('id', $request->category_id)->update([
            'category_name'=>$request->category_name,
            'category_short_description'=>$request->category_short_description,
            'category_long_description'=>$request->category_long_description,
            // 'category_image'=>$path,
        ]);

        if($data){
            return response([
                'message' => 'Category updated',
                'status' =>'success',
                
            ], 200);

        }
        else{
            return response([
                'message' => 'Category not updated',
                'status' =>'failed',
                
            ], 422);
        }

    }

    public function update_category_image(Request $request){
        $validator = Validator::make($request->all(), [
            'category_id'=>'required',
            'category_image'=>'mimes:png,jpg,jpeg,gif,svg|max:2048',
            
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }

        if ($file = $request->file('category_image')) {
            $path = $file->store('files/category_images');
            $name = $file->getClientOriginalName();
        }


        $data = DB::table('course_categories')->where('id', $request->category_id)->update([
            
            'category_image'=>$path,
        ]);

        if($data){
            return response([
                'message' => 'Category updated',
                'status' =>'success',
                
            ], 200);

        }
        else{
            return response([
                'message' => 'Category not updated',
                'status' =>'failed',
                
            ], 422);
        }

    }


    public function create_category(Request $request){
        $validator = Validator::make($request->all(), [
            'category_name'=>'required',
            'category_short_description'=>'required',
            'category_long_description'=>'required',
            'category_image'=>'required|mimes:png,jpg,jpeg,gif,svg|max:2048',
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }

        if ($file = $request->file('category_image')) {
            $path = $file->store('files/category_images');
            $name = $file->getClientOriginalName();
        }
        $create = DB::table('course_categories')->insert([
            'category_name'=>$request->category_name,
            'category_short_description'=>$request->category_short_description,
            'category_long_description'=>$request->category_long_description,
            'category_image'=>$path,

        ]);
        if($create){
            return response([
                'message' => 'Category Added',
                'status' =>'success',
                
            ], 200);

        }




    }



    // faqs 

    public function get_course_faqs(Request $request){
        $validator = Validator::make($request->all(), [
            'course_id'=>'required',
            
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }


        $data = DB::table('course_faqs')
        ->where('course_id', $request->course_id)
        ->get();

        if($data){
            return response([
                'Data' => $data,
                'status' =>'success',
                
            ], 200);
        }

    }

    public function delete_course_faqs(Request $request){
        $validator = Validator::make($request->all(), [
            'course_faqs_id'=>'required',
            
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }


        $data = DB::table('course_faqs')->where('id', $request->course_faqs_id)->delete();

        if($data){
            return response([
                'message' => 'Course Faqs Deleted',
                'status' =>'success',
                
            ], 200);
        }

    }

    public function update_course_faqs(Request $request){
        $validator = Validator::make($request->all(), [
            'course_faqs_id'=>'required',
            
            
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }



        $data = DB::table('course_faqs')->where('id', $request->course_faqs_id)->update([
            'faqs_ques'=>$request->faqs_ques,
            'faqs_ans'=>$request->faqs_ans,
            
        ]);

        if($data){
            return response([
                'message' => 'Course faqs updated',
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

    


    public function create_course_faqs(Request $request){
        $validator = Validator::make($request->all(), [
            'course_id'=>'required',
            'faqs_ques'=>'required',
            'faqs_ans'=>'required',
            
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }

        
        $create = DB::table('course_faqs')->insert([
            'course_id'=>$request->course_id,
            'faqs_ques'=>$request->faqs_ques,
            'faqs_ans'=>$request->faqs_ans,
            

        ]);
        if($create){
            return response([
                'message' => 'Faqs Added',
                'status' =>'success',
                
            ], 200);

        }




    }
    // faqs end



     // course motive 

     public function get_course_motive(Request $request){
        $validator = Validator::make($request->all(), [
            'course_id'=>'required',
            
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }


        $data = DB::table('course_motive')
        ->where('course_id', $request->course_id)
        ->get();

        if($data){
            return response([
                'Data' => $data,
                'status' =>'success',
                
            ], 200);
        }

    }

    public function delete_course_motive(Request $request){
        $validator = Validator::make($request->all(), [
            'course_motive_id'=>'required',
            
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }


        $data = DB::table('course_motive')->where('id', $request->course_motive_id)->delete();

        if($data){
            return response([
                'message' => 'Course motive Deleted',
                'status' =>'success',
                
            ], 200);
        }

    }

    public function update_course_motive(Request $request){
        $validator = Validator::make($request->all(), [
            'course_motive_id'=>'required',
            
            
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }



        $data = DB::table('course_motive')->where('id', $request->course_motive_id)->update([
            'motive1'=>$request->motive1,
            'motive2'=>$request->motive2,
            'motive3'=>$request->motive3,
            'motive4'=>$request->motive4,
            
        ]);

        if($data){
            return response([
                'message' => 'Course motive updated',
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

    


    public function create_course_motive(Request $request){
        $validator = Validator::make($request->all(), [
            'course_id'=>'required',
            'motive1'=>'required',
            'motive2'=>'required',
            'motive3'=>'required',
            'motive4'=>'required',
            
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }

        
        $create = DB::table('course_motive')->insert([
            'course_id'=>$request->course_id,
            'motive1'=>$request->motive1,
            'motive2'=>$request->motive2,
            'motive3'=>$request->motive3,
            'motive4'=>$request->motive4,
            

        ]);
        if($create){
            return response([
                'message' => 'Course motive Added',
                'status' =>'success',
                
            ], 200);

        }


    }
    // course motive end





    public function CreateCourse(Request $request){
        $validator = Validator::make($request->all(), [
            'course_name' => 'required',
            'course_short_description'=>'required',
            'course_long_description'=>'required',
            'course_language'=>'required',
            'category_id'=>'required',
            'course_feature_image'=>'required|mimes:png,jpg,jpeg,gif,svg|max:2048',
            'teacher_id'=>'required',
            
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }


        if ($file = $request->file('course_feature_image')) {
            $path = $file->store('files/course_feature_images');
            $name = $file->getClientOriginalName();

          
 
           
        }

        $create = DB::table('courses')->insertGetId([
            'course_name'=>$request->course_name,
            'course_short_description'=>$request->course_short_description,
            'course_long_description'=>$request->course_long_description,
            'course_language'=>$request->course_language,
            'course_feature_image'=>$path,
            'category_id'=>$request->category_id,
            'teacher_id'=>$request->teacher_id,

        ]);

        $insert = DB::table('course_aim')->insertGetId([
            'course_id'=>$create,

        ]);
        $insertreq = DB::table('course_requirements')->insertGetId([
            'course_id'=>$create,

        ]);
        $insertmotive = DB::table('course_motive')->insertGetId([
            'course_id'=>$create,

        ]);

        $update =  DB::table('courses')->where('id',$create)->update([
            'course_requirement_id'=>$insertreq,
            'course_aim_id'=>$insert,
            'course_motive_id'=>$insertmotive,

        ]);


        
        $data = $request->all(); 

        

        
        if($update){
            return response([
                'message' => 'Course Created successfully',
                'status' =>'success',
                'course_id' => $create,
            ], 200
        );
        }

    }


    public function course_update_first(Request $request){
        $validator = Validator::make($request->all(), [
            'course_id' => 'required',
            
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }

        $insert_motive = DB::table('course_motive')->where('course_id',$request->course_id)->update([
            'motive1'=>$request->motive1,
            'motive2'=>$request->motive2,
            'motive3'=>$request->motive3,
            'motive4'=>$request->motive4,

        ]);

        // if($insert_motive){
        //     return response([
        //         'message' => 'Course Motive added successfully',
        //         'status' =>'success',
        //     ], 200
        // );

        // }
        // else{
        //     return response([
        //         'message' => 'Course Motive  not added ',
        //         'status' =>'failed',
                
        //     ], 422
        // );


        // }
        
        $insert_requirement = DB::table('course_requirements')->where('course_id', $request->course_id)->update([
            'requirement_1'=>$request->requirement_1,
            'requirement_2'=>$request->requirement_2,
            'requirement_3'=>$request->requirement_3,
            'requirement_4'=>$request->requirement_4,
            'requirement_5'=>$request->requirement_5,

        ]);

        // if($insert_requirement){
        //     return response([
        //         'message' => 'Course Requirements added successfully',
        //         'status' =>'success',
        //     ], 200
        // );

        // }
        // else{
        //     return response([
        //         'message' => 'Course requirement  not added ',
        //         'status' =>'failed',
                
        //     ], 422
        // );


        // }

        $insert_aim = DB::table('course_aim')->where('course_id', $request->course_id)->update([
            'course_aim'=>$request->course_aim,

        ]);

        // if($insert_aim){
        //     return response([
        //         'message' => 'Course aim added successfully',
        //         'status' =>'success',
        //     ], 200
        // );

        // }
        // else{
        //     return response([
        //         'message' => 'Course aim  not added ',
        //         'status' =>'failed',
                
        //     ], 422
        // );


        // }


    


   
        $data = $request->all(); 

    
        if($insert_aim ){

            return response([
                'message' => 'Course saved saved successfully',
                'status' =>'success',
                
            ], 200
        );
        }
        else{
            return response([
                'message' => 'Course not saved ',
                'status' =>'failed',
                
                
            ], 422
        );


        }


    }


    public function course_setup_video_details(Request $request){
        $validator = Validator::make($request->all(), [
            'teacher_id' => 'required',
            'microphone_type'=>'required',
            'camera_type'=>'required',
            'operating_system'=>'required',
            'software'=>'required',
            'video_language'=>'required',
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }


        $create = DB::table('setup_video')->insertGetId([
            'teacher_id'=>$request->teacher_id,
            'microphone_type'=>$request->microphone_type,
            'camera_type'=>$request->camera_type,
            'operating_system'=>$request->operating_system,
            'software'=>$request->software,
            'video_language'=>$request->video_language,

        ]);
        $data = $request->all(); 

        

        
        if($create){
            return response([
                'message' => 'setup video details added successfully',
                'status' =>'success',
                'setup_id' => $create,
            ], 200
        );
        }
        else{
            return response([
                'message' => 'setup video details not saved ',
                'status' =>'failed',
                
            ], 422
        );


        }


    }


    public function upload_setup_video(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'setup_id' => 'required',
            'title'=>'required',
            'description'=>'required',
            'video'=>'required'

        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }

        // $video = Youtube::upload($request->file('video')->getPathName(), [
        //     'title'       => $request->input('title'),
        //     'description' => $request->input('description'),
        //     'privacyStatus'=>"unlisted",
        // ]);

        if ($file = $request->file('video')) {
            $path = $file->store('files/setup_videos');
            $name = $file->getClientOriginalName();

          
 
           
        }

        

        if($file){
            $insert = DB::table('setup_video')->where('id', $request->setup_id)->update([
                'video'=>$path,
                'title'=>$request->title,
                'description'=>$request->description,
                'status'=>'Pending',
   
           ]);
           return response([
            'message' => 'Video Upload successfully. ' ,
            'video_id'=>$path,
            'status' =>'success',
            
        ], 200);
                
        }
        else{
            return response([
                'message' => 'setup video  not uploaded ',
                'status' =>'failed',
                
            ], 422
        );
    
    
        }
  
        
    }



    public function get_setup_video_details(Request $request){
        $validator = Validator::make($request->all(), [
            'teacher_id' => 'required',
            
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }

        $create1 = DB::table('setup_video')->where('teacher_id', $request->teacher_id)->value('id');
        $create = DB::table('setup_video')->where('teacher_id', $request->teacher_id)->get();
        $data = $request->all(); 

        

        
        if(!empty($create1)){
            return response([
                'message' => 'Details Fetched',
                'status' =>'success',
                'Data' => $create,
            ], 200
        );
        }
        else{
            return response([
                'message' => 'Not found ',
                'status' =>'failed',
                
            ], 422
        );


        }


    }

    public function update_setup_video_status(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'setup_id' => 'required',
            'status'=>'required',

        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }


        

        
            $update = DB::table('setup_video')->where('id', $request->setup_id)->update([
                'status'=>$request->status,
               
           ]);
           if($update){
           return response([
            'message' => 'setup Video status updated successfully. ' ,
            'status' =>'success',
            
        ], 200);
                
        }
        else{
            return response([
                'message' => 'setup video status not updated ',
                'status' =>'failed',
                
            ], 422
        );
    
    
        }
  
    }


    public function update_course_image(Request $request){
        $validator = Validator::make($request->all(), [
            'course_id' => 'required',
             'course_feature_image'=>'required|mimes:jpeg,svg,gif,png,jpg,|max:2048',
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }


      if ($file = $request->file('course_feature_image')) {

        $path = $file->store('files/course_feature_images');
            $name = $file->getClientOriginalName();

           
 
           
        }
    


        $create = DB::table('courses')->where('id', $request->course_id)->update([
             'course_feature_image'=>$path,

        ]);
        $data = $request->all(); 

        

        
        if($create){
            return response([
                'message' => 'Course image uploaded successfully',
                'status' =>'success',
                'Data'=>$data,
            ], 200
        );
        }
        else{
            return response([
                'message' => 'not uploaded',
                'status' =>'failed',
                'errors'=>$validator->errors()->all(),
                
            ], 422
        );

        }

    }



    //Course Content



    public function create_course_section(Request $request){
        $validator = Validator::make($request->all(), [
            "course_id"=>"required",
            "section_title"=>"required",
            "section_description"=>"required",


        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }


      
            $insert_section = DB::table('course_sections')->insertGetId([
                'course_id'=>$request->course_id,
                'section_title'=>$request->section_title,
                'section_description'=>$request->section_description,
                'section_no'=>$request->section_no,
            
            ]);
            if($insert_section){
            return response([
                'message' => 'Section added successfully. ' ,
                'status' =>'success',
                'section_id'=>$insert_section,
                
            ], 200);
                
        }
  
        
        else{
            return response([
                'message' => 'not added',
                'status' =>'failed',
                'errors'=>$validator->errors()->all(),
                
            ], 422
        );

        }

    }



    public function update_course_section(Request $request){
        $validator = Validator::make($request->all(), [
            "section_id"=>"required",
            


        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }


      
            $insert_section = DB::table('course_sections')->where('id', $request->section_id)->update([
                
                'section_title'=>$request->section_title,
                'section_description'=>$request->section_description,
                'section_no'=>$request->section_no,
            
            ]);
            if($insert_section){
            return response([
                'message' => 'Section updated successfully. ' ,
                'status' =>'success',
                'section_id'=>$request->section_id,
                
            ], 200);
                
        }
  
        
        else{
            return response([
                'message' => 'not updated',
                'status' =>'failed',
                'errors'=>$validator->errors()->all(),
                
            ], 422
        );

        }

    }




    public function course_lecture_content(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'lecture_no'=>'required',
            'course_id' => 'required',
            'title'=>'required',
            'description'=>'required',
            'video'=>'required',
            'material_short_description'=>'required|max:150',
            'material_title'=>'required|max:30',
            'material_file'=>'required|mimes:pdf,docs,doc,ppt,pptx,|max:20480',
            'lecture_image'=>'required',
            // 'assignment_ques'=>'required',
            // 'assignment_ans'=>'required',
            // 'assignment_option_1'=>'required',
            // 'assignment_option_2'=>'required',
            // 'assignment_option_3'=>'required',
            // 'assignment_option_4'=>'required',


        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }

        // $video = Youtube::upload($request->file('video')->getPathName(), [
        //     'title'       => $request->input('title'),
        //     'description' => $request->input('description'),
        //     // 'tags'=>$request->input('tags')
        // ]);
        // ->withThumbnail($request->file('image')->getPathName());

        // $file = $request->file('image');
        //     $path = $file->store('files/lecture_images');
        //     $name = $file->getClientOriginalName();


        $lecture_no = $request->lecture_no;

        if ($file = $request->file('video')) {
            $path = $file->store('files/lecture_videos');
            $name = $file->getClientOriginalName();
           
        }
        if ($file1 = $request->file('lecture_image')) {
            $pathlecture = $file1->store('files/lecture_images');
            $name = $file1->getClientOriginalName();
           
        }

        

        // if($file){
            $insert_lecture = DB::table('course_lectures')->insertGetId([
                'course_id'=>$request->course_id,
                'lecture_name'=>$request->title,
                'lecture_long_description'=>$request->description,
                'lecture_video'=>$path,
                'feature_image'=>$pathlecture,
                'section_id'=>$request->section_id,
                'lecture_number'=>$request->lecture_no,
            
            ]);
            // return response([
            //     'message' => 'Video Upload successfully. ' ,
            //     'video_id'=>$path,
            //     'status' =>'success',
            //     'lecture_id'=>$insert_lecture,
                
            // ], 200);
                
        // }
  
        
        // else{
        //     return response([
        //         'message' => 'not uploaded',
        //         'status' =>'failed',
        //         'errors'=>$validator->errors()->all(),
                
        //     ], 422
        // );

        // }
        if($insert_lecture){
            if($file = $request->file('material_file')) {
                $path = $file->store('files/course_materials');
                $name = $file->getClientOriginalName();
     
               
            }
    
            $create_material = DB::table('course_materials')->insertGetId([
                'course_id'=>$request->course_id,
                'material_short_description'=>$request->material_short_description,
                
                'course_lecture_id'=>$insert_lecture,
                'material_title'=>$request->material_title,
                'material_file'=>$path,
                'lecture_no'=>$request->lecture_no,
    
            ]);
            $data = $request->all(); 
    
            
    
            
    
            
            if($create_material){
                $update = DB::table('course_lectures')->where('id',$insert_lecture)->update([
                    'lecture_material_id'=>$create_material,
                   
        
                ]);


                return response([
                    'message' => 'Course Lecture and material Added successfully',
                    'status' =>'success',
                    'material_id'=>$create_material,
                    'lecture_id'=>$insert_lecture,
                ], 200

            );
            }
            else{
                return response([
                    'message' => 'not added',
                    'status' =>'failed',
                    'errors'=>$validator->errors()->all(),
                    
                ], 422
            );
    
            }

        }

        



       

        // $create_assignment = DB::table('course_assignments')->insertGetId([
        //     'course_id'=>$request->course_id,
            
        //     'lecture_id'=>$request->course_lecture_id,
        //     'assignment_no'=>$request->lecture_no,

        // ]);
        // $data = $request->all(); 

        

        
        // if($create_assignment){
        //     $create_assignment_ques = DB::table('course_assignments_ques_ans')->insertGetId([
        //         'assignment_id'=>$create_assignment,
        //         'assignment_ques'=>$request->assignment_ques,
        //         'assignment_ans'=>$request->assignment_ans,

    
        //     ]);
        //     if($create_assignment_ques){
        //         $add_option
        //     }



        //     return response([
        //         'message' => 'Assignment Added successfully',
        //         'status' =>'success',
        //         'Data'=>$data,
        //     ], 200
        // );
        // }


    
    }


    public function add_assignments(Request $request){
        $validator = Validator::make($request->all(), [
            'lecture_no'=>'required',
            'course_id' => 'required',
            'lecture_id'=>'required',

            // 'assignment_ques'=>'required',
            // 'assignment_ans'=>'required',
           


        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }
               $create_assignment = DB::table('course_assignments')->insertGetId([
            'course_id'=>$request->course_id,
            
            'lecture_id'=>$request->lecture_id,
            'assignment_no'=>$request->lecture_no,

        ]);
        $data = $request->all(); 
        var_dump($data);

        
        $assignment_ques = $request->assignment_ques;
        $assignment_ans = $request->assignment_ans;
       
            if($create_assignment){
                for($i=0;$i<count($assignment_ques); $i++ ){
                    // echo $assignment_ques[$i];
                    
                    
                    $create_assignment_ques = DB::table('course_assignments_ques_ans')->insertGetId([
                        'assignment_id'=>$create_assignment,
                        'assignment_ques'=>$assignment_ques[$i],
                        'assignment_ans'=>$assignment_ans[$i],

                        
        
            
                    ]);
                   
                    // $question_id = $create_assignment_ques[$i];
                    // print_r($question_id);

                }
                $get = DB::select('SELECT id FROM course_assignments_ques_ans WHERE assignment_id = '.$create_assignment);
                
                    for($i=0;$i<count($get); $i++ ){
                        $array = json_decode(json_encode($get),true);
                        
                    }
                    // print_r($array[0]['id']);


                    for($i=0;$i<count($array); $i++ ){
                        // echo $assignment_ques[$i];
                        
                        
                        $option = DB::table('course_assignments_question_options')->insertGetId([
                            'assignment_id'=>$create_assignment,
                            'option1'=>$request->option1[$i],
                            'option2'=>$request->option2[$i],
                            'option3'=>$request->option3[$i],
                            'option4'=>$request->option4[$i],
                            'question_id'=>$array[$i]['id'],
                            'course_id'=>$request->course_id,
    
                            
            
                
                        ]);
                       
                        // $question_id = $create_assignment_ques[$i];
                        // print_r($question_id);
    
                    }
                
               

    
                return response([
                    'message' => 'Assignment Added successfully',
                    'status' =>'success',
                    'assignment_id'=>$create_assignment,
                    'assignment_question_id'=>$create_assignment_ques,
                    'Data'=>$data,
                    
                ], 200
            );
            

        }
        


    }


    public function add_course_project(Request $request){
        $validator = Validator::make($request->all(), [
            'course_id' => 'required',
            
            'project_file'=>'required|max:204800',
            'project_name'=>'required',
            'project_long_description'=>'required',
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }
        if ($file = $request->file('project_file')) {
            $path = $file->store('files/course_project');
            $name = $file->getClientOriginalName();
 
           
        }

        
        $create = DB::table('course_projects')->insertGetId([
            'course_id'=>$request->course_id,
            'project_long_description'=>$request->project_long_description,
            'project_name'=>$request->project_name,
            'project_file'=>$path,

        ]);
        $data = $request->all(); 

        

        
        if($create){
            $update = DB::table('courses')->where('id',$request->course_id)->update([
                'course_project_id'=>$create,
    
            ]);


            return response([
                'message' => 'Course project Added successfully',
                'status' =>'success',
                'Data'=>$data,
            ], 200
        );
        }

    }



    public function update_course_landing_page(Request $request){
        $validator = Validator::make($request->all(), [
            'course_id'=>'required',
            
            
            
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }



        $data = DB::table('courses')->where('id', $request->course_id)->update([
            'course_name'=>$request->course_name,
            'course_short_description'=>$request->course_short_description,
            'course_long_description'=>$request->course_long_description,
            'course_language'=>$request->course_language,
            'category_id'=>$request->category_id,
            'level_of_course'=>$request->level_of_course,
            'course_welcome_message'=>$request->course_welcome_message,
            'course_complete_message'=>$request->course_complete_message,
            'total_lectures'=>$request->total_lectures,
            'total_hours_lectures'=>$request->total_hours_lectures,
            'course_price'=>$request->course_price,


            
        ]);

        if($data){
            return response([
                'message' => 'Course Updated',
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


    public function course_final_submit(Request $request){
        $validator = Validator::make($request->all(), [
            'course_id' => 'required',
            'teacher_id'=>'required',
            
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }

        $insert = DB::table('course_review_requests')->insert([
            'course_id'=>$request->course_id,
            'teacher_id'=>$request->teacher_id,
        ]);
        if($insert){
            $update = DB::table('courses')->where('id', $request->course_id)->update([
                'status'=>'Pending',
            ]);
            return response([
                'message' => 'Course Submitted for review successfully',
                'status' =>'success',
            ], 200
        );
        }
        else{
            return response([
                'message' => 'not submiited',
                'status' =>'failed',
            ], 422
        );
        }


    }


    public function setup_video_request(Request $request){
        $validator = Validator::make($request->all(), [
            'setup_id' => 'required',
            'teacher_id'=>'required',
            
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }

        $insert = DB::table('setup_video_requests')->insert([
            'setup_id'=>$request->setup_id,
            'teacher_id'=>$request->teacher_id,
        ]);
        if($insert){
            $update = DB::table('courses')->where('id', $request->course_id)->update([
                'status'=>'Pending',
            ]);
            return response([
                'message' => 'Video Submitted for review successfully',
                'status' =>'success',
            ], 200
        );
        }
        else{
            return response([
                'message' => 'not submiited',
                'status' =>'failed',
            ], 422
        );
        }


    }


    public function get_course_requests(){
        $data = DB::table('course_review_request')->where('status', 'Pending')->get();
        if($data){
            return response([
                'Data' => $data,
                'status' =>'success',
            ], 200
        );
        }
        else{
            return response([
                'Data' => 'not found',
                'status' =>'failed',
            ], 422
        );
        }


    }

    public function update_course_requests(Request $request){
        $validator = Validator::make($request->all(), [
            'request_id' => 'required',
            'course_id'=>'required',
            
            
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }
        $data = DB::table('course_review_request')->where('id', $request->request_id)->update([
            'status'=>$request->status,
        ]);
        if($request->status=="Approved"){
            $is_published = 1;
            $course_saved_in = "Published";

        }
        else{
            $is_published = 0;
            $course_saved_in = "Draft";

        }
        if($data){
            $update = DB::table('courses')->where('id', $request->course_id)->update([
                'status'=>$request->status,
                'is_published'=>$is_published,
                'course_saved_in'=>$course_saved_in,
            ]);
            return response([
                'message' => "Status Updated.",
                'status' =>'success',
            ], 200
        );
        }
        else{
            return response([
                'message' => 'not Updated',
                'status' =>'failed',
            ], 422
        );
        }


    }



    public function create_course_content(Request $request){
        $validator = Validator::make($request->all(), [
            'course_id' => 'required',
            'material_short_description'=>'required|max:150',
            'material_title'=>'required|max:30',
           
            'course_lecture_id'=>'required',
            'material_file'=>'required|mimes:pdf,docs,doc,ppt,pptx,|max:20480',
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
            'material_short_description'=>$request->material_short_description,
            
            'course_lecture_id'=>$request->course_lecture_id,
            'material_title'=>$request->material_title,
            'material_file'=>$path,

        ]);
        $data = $request->all(); 

        

        
        if($create){
            return response([
                'message' => 'Course material Added successfully',
                'status' =>'success',
                'Data'=>$data,
            ], 200
        );
        }

    }



    public function get_course_content(Request $request){
        $validator = Validator::make($request->all(), [
            'course_id'=>'required',
            
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }


        $data = DB::table('course_materials')
        ->where('course_id', $request->course_id)
        ->get();

        if($data){
            return response([
                'Data' => $data,
                'status' =>'success',
                
            ], 200);
        }

    }

    public function update_course_content(Request $request){
        $validator = Validator::make($request->all(), [
            'course_material_id'=>'required',
            
            
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }



        $data = DB::table('course_materials')->where('id', $request->course_material_id)->update([
            'material_titile'=>$request->material_title,
            'material_short_description'=>$request->material_short_description,
            
            
        ]);

        if($data){
            return response([
                'message' => 'Course material updated',
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

    public function delete_course_content(Request $request){
        $validator = Validator::make($request->all(), [
            'course_material_id'=>'required',
            
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }


        $data = DB::table('course_materials')->where('id', $request->course_material_id)->delete();

        if($data){
            return response([
                'message' => 'Course material Deleted',
                'status' =>'success',
                
            ], 200);
        }

    }


    public function delete_course_lecture(Request $request){
        $validator = Validator::make($request->all(), [
            'lecture_id'=>'required',
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }
        $assignment_id = DB::table('course_lectures')->where('id',$request->lecture_id)->value('lecture_assignment_id');
        $material_id = DB::table('course_lectures')->where('id',$request->lecture_id)->value('lecture_material_id');

        $delete = DB::table('course_lectures')->where('id', $request->lecture_id)->delete();
        if($delete){
            $delete_assignment = DB::table('course_assignments')->where('id', $assignment_id)->delete();
            $delete_assignment_ques = DB::table('course_assignments_ques_ans')->where('assignment_id', $assignment_id)->delete();
            $delete_material = DB::table('course_materials')->where('id', $material_id)->delete();
            return response([
                'message' => ' Deleteed successfully',
                'status' =>'success',
            ], 200
        );
        }
        else{
            return response([
                'message' => ' not deleted successfully',
                'status' =>'failed',
            ], 422
        );

        }

    }

    public function upload_image(Request $request){
        $validator = Validator::make($request->all(), [
            // 'course_id' => 'required',
             'image'=>'required|mimes:jpg,png,jpeg,gif,svg|max:2048',
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }
        


      if ($file = $request->file('image')) {

        $path = $file->store('files/uploads');
            $name = $file->getClientOriginalName();

           
 
           
        }
    // $path = $request->course_feature_image;


        $create = DB::table('images')->insert([
             'image'=>$path,

        ]);
        $data = $request->all(); 

        

        
        if($create=true){
            return response([
                'message' => ' image uploaded successfully',
                'status' =>'success',
                'Data'=>$data,
            ], 200
        );
        }
        else{
            return response([
                'message' => 'not uploaded',
                'status' =>'failed',
                'errors'=>$validator->errors()->all(),
                
            ], 422
        );

        }

    }




    
        

    
        
}

