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
use Youtube;
  
class YoutubeController extends Controller
{



    public function upload_video(Request $request){
        $validator = Validator::make($request->all(), [
            'title'=>'required',
            'description'=>'required',
            'video'=>'required'

        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }

        $video = Youtube::upload($request->file('video')->getPathName(), [
            'title'       => $request->input('title'),
            'description' => $request->input('description'),
            
        ]);
        if($video){
            return response([
                'message' => 'Video Upload successfully. But It will not show  untill it get approved' ,
                'video_id'=>$video->getVideoId(),
                'status' =>'success',
                
            ], 200);
        }
        else{
            return response([
                'message' => 'failedshow  untill it get approved' ,
                'status' =>'failed',
                
            ], 422);

        }

    }
    
 

    public function upload_course_lecture_video(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'course_id' => 'required',
            'title'=>'required',
            'description'=>'required|min:200',
            'video'=>'required'

        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], 422);
        }

        $video = Youtube::upload($request->file('video')->getPathName(), [
            'title'       => $request->input('title'),
            'description' => $request->input('description'),
            'tags'=>$request->input('tags')
        ])->withThumbnail($request->file('image')->getPathName());

        $file = $request->file('image');
            $path = $file->store('files/lecture_images');
            $name = $file->getClientOriginalName();
        

        if($video){
            $insert = DB::table('course_lectures')->insert([
                'course_id'=>$request->course_id,
                'lecture_name'=>$request->title,
                'lecture_long_description'=>$request->description,
                'lecture_video'=>$video->getVideoId(),
                'feature_image'=>$path,
                'video_tags'=>$request->tags,
            
            ]);
                
        }
  
        return response([
            'message' => 'Video Upload successfully. But It will not show  untill it get approved' ,
            'video_id'=>$video->getVideoId(),
            'status' =>'success',
            
        ], 200);
    }
    
}