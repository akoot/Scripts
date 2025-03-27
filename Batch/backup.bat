@echo off

REM This is a DIY script!
REM X:\ is an encrypted removable SSD which I remove right after backing up
REM Y:\ is where I keep all my projects
REM Z:\ is where I keep all my documents etc (home)
Rem W:\ is another encrypted drive

REM Check if X:\ is mounted
if exist X:\ (
    echo X:\ is mounted. Proceeding with backup...

    REM Mirror Y:\ to X:\Projects
    robocopy Y:\ X:\Projects /MIR

    REM Mirror Z:\ to X:\Home, excluding Movies and Videos
    robocopy Z:\ X:\Home /MIR /XD Z:\Movies Z:\Videos

) else (
    echo X:\ is not mounted, skipping.
)

REM Mirror Y:\ to W:\Backup\Projects
robocopy Y:\ W:\Backup\Projects /MIR

REM Mirror Z:\ to W:\Backup\Home, excluding Movies and Videos
robocopy Z:\ W:\Backup\Home /MIR /XD Z:\Movies Z:\Videos

echo Backup completed!

pause
