<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Certificate</title>
    <style>
        body { margin: 0; }
        .background { position: absolute; top: 0; left: 0; width: 100%; height: 100%; z-index: -1; }
        .container { text-align: center; margin-top: 210px; padding: 40px; }
        h1 { font-size: 36pt; margin-bottom: 10px; color: #2f5496; }
        p { font-size: 18pt; font-family: Calibri, sans-serif; color: #1f3864; }
        .qr-code { margin-top: 90px; text-align: center; }
        .qr-code span { font-size: 14pt; margin-top: 10px; }
    </style>
</head>
<body>
    <img src="{{ $backgroundImage }}" alt="Background" class="background" />
    <div class="container">
        <h1>{{ $teacherName }}</h1>
        <p>{!! $body !!}</p>
        @if($showQr){ 
            <div class="qr-code">
                <img src="data:image/png;base64,{{ $qrCodeImage }}" alt="QR Code" /><br>
                <span>Certificate ID: {{ $certificateId }}</span>
            </div>
        }@endif  
    </div>
</body>
</html>