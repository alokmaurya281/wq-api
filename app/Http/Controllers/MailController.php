<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Mail\SendMail;

use Illuminate\Support\Facades\Mail;


class MailController extends Controller
{
    public function sendEmail() { 
                $sendmail = Mail::to($email)->send(new SendMail($subject, $message, $token)); 
                if (empty($sendmail)) { 
                    return response()->json(['message' => 'Mail Sent Sucssfully'], 200); 
                }
                    
                    else{ return response()->json(['message' => 'Mail Sent fail'], 400); 
                    } 
                }


}
