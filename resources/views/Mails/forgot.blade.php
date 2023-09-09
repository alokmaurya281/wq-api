@component('mail::message')
# Email Verification

password reset link <a href="https://localhost/reset/{{$token}}">click</a>

Thanks,<br>
{{ config('app.name') }}
@endcomponent