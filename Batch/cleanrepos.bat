@echo off
setlocal enabledelayedexpansion

REM Clean up all java/kotlin repos in a directory at once (recursive) by running gradle/mvn clean

REM Set the starting directory (current directory by default)
set "START_DIR=%cd%"

REM Function to recursively scan for build.gradle or pom.xml
:scan
for /d %%d in ("%~1\*") do (
    if exist "%%d\build.gradle" (
        echo Found build.gradle in: %%d
        cd "%%d"
        if exist "gradlew.bat" (
            echo Running gradlew clean in: %%d
            call .\gradlew.bat clean
        ) else (
            echo gradlew.bat not found in %%d, skipping.
        )
        cd "%START_DIR%"
    ) else if exist "%%d\pom.xml" (
        echo Found pom.xml in: %%d
        cd "%%d"
        echo Running mvn clean in: %%d
        call mvn clean
        cd "%START_DIR%"
    ) else (
        REM Recursively call this function for the subdirectory
        call :scan "%%d"
    )
)
exit /b

REM Initial call to the scan function
call :scan "%START_DIR%"

echo Done!
pause
