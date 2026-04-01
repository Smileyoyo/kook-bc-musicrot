@echo off

echo ========================================
echo   KOOK Music Bot - Init Gradle
echo ========================================
echo.

cd /d "%~dp0"

REM Check if already exists
if exist "gradle\wrapper\gradle-wrapper.jar" (
    echo [OK] gradle-wrapper.jar already exists
    echo You can run: build.bat
    echo.
    pause
    exit /b 0
)

REM Create directories
if not exist "gradle\wrapper" (
    echo [Creating] gradle\wrapper directory...
    mkdir gradle\wrapper
)

REM Download using PowerShell
echo [Downloading] gradle-wrapper.jar...
echo.

powershell -Command "& {Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/gradle/gradle/v8.5.0/gradle/wrapper/gradle-wrapper.jar' -OutFile 'gradle\wrapper\gradle-wrapper.jar'}"

if errorlevel 1 (
    echo.
    echo [ERROR] Download failed
    echo.
    echo Please download manually:
    echo 1. Visit: https://raw.githubusercontent.com/gradle/gradle/v8.5.0/gradle/wrapper/gradle-wrapper.jar
    echo 2. Save to: gradle\wrapper\gradle-wrapper.jar
    echo.
    pause
    exit /b 1
)

echo.
echo [Checking] download...
if exist "gradle\wrapper\gradle-wrapper.jar" (
    echo [SUCCESS] gradle-wrapper.jar downloaded successfully
    echo.
    echo You can now run: build.bat
) else (
    echo [ERROR] File not found after download
    echo Please try again or download manually
)

echo.
pause
