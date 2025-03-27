@echo off

REM This is a DIY script!
REM X:\ is an encrypted removable SSD which I remove right after backing up
REM Y:\ is where I keep all my projects
REM Z:\ is where I keep all my documents etc (home)

REM Check if X:\ is mounted
if exist X:\ (
    echo X:\ is mounted. Proceeding with backup...

    REM Mirror Y:\ to X:\Projects
    robocopy Y:\ X:\Projects /MIR

    REM Mirror Z:\ to X:\Home, excluding Movies and Videos
    robocopy Z:\ X:\Home /MIR /XD Z:\Movies Z:\Videos

    echo Backup completed!
) else (
    echo X:\ is not mounted. Aborting backup.
)

pause
