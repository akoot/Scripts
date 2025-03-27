@echo off
color c
yt-dlp --extract-audio --audio-format=wav %*
color