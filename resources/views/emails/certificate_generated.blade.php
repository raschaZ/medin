<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Certificate</title>
</head>
<body>
    <h1>Hello, {{ $teacher->name }}!</h1>
    <p>Your course certificate for <strong>{{ $course->title }}</strong> is ready.</p>
    <p>You can download your certificate by clicking the link below:</p>
    <a href="{{ $certificateUrl }}" target="_blank">Download Certificate </a>
    <p>Thank you for teaching with us!</p>
</body>
</html>