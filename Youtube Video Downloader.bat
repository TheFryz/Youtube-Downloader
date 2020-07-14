@echo off
title Youtube Downloader - Fryz
if not exist .\output mkdir .\output
cd Lib
echo Checking for updates...
youtube-dl -U
ping localhost -n 2 >nul

:top
title Youtube Downloader - Fryz
cls
echo Youtube Downloader - Fryz
set /p id="Video Url: "
echo.
echo Searching...
youtube-dl -F %id%
echo If not status above, not a valid ID
echo.
set /p type="Mp3/Mp4(Lower Case): "
if %type%==mp3 goto mp3
if %type%==mp4 goto mp4
goto mp4

:mp4
cls
title Downloading Mp4 - Fryz
echo Downlading - Fryz
youtube-dl -f 22 -o ..\output\%%(title)s.%%(ext)s %id%
echo.
ping localhost -n 3 >nul
goto top

:mp3
cls
title Downloading Mp3 - Fryz
echo Downloading - Fryz
youtube-dl --extract-audio --audio-format "mp3" --audio-quality 0 --youtube-skip-dash-manifest -o ..\output\%%(title)s.%%(ext)s %id%
echo.
goto top