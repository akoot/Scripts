@echo off
color c
yt-dlp --extract-audio --audio-format=mp3 %*
color