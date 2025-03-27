@echo off
REM Convert a file to a new format
REM Syntax: cv file.ext1 ext2
REM Example: cv video.mp4 mp3
ffmpeg -i "%~1" "%~n1.%~2"
