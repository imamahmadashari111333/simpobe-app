<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ config('app.name', 'SIMPOBE') }}</title>

        <link rel="icon" type="image/png" href="{{ asset('img/simpobe.png') }}">
    @livewireStyles
    @vite(['resources/css/app.css', 'resources/js/app.js'])
</head>
<body>
    {{ $slot }} {{-- Ini tempat Livewire merender kontennya --}}
    
    @livewireScripts
</body>
</html>