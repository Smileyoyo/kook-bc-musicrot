@echo off

echo ========================================
echo   KOOK Music Bot - Build & Install
echo ========================================
echo.

cd /d "%~dp0"

REM Check if Gradle Wrapper files exist
if not exist "gradle\wrapper\gradle-wrapper.jar" (
    if not exist "gradle\wrapper\gradle-wrapper.properties" (
        echo [INFO] Gradle Wrapper not initialized
        echo Running init-gradle.bat first...
        echo.
        call init-gradle.bat
        if errorlevel 1 (
            echo.
            echo [ERROR] Init failed
            echo Please check your network connection
            echo.
            pause
            exit /b 1
        )
    )
)

REM Build
echo [Step 1] Building...
call build.bat
if errorlevel 1 (
    echo.
    echo [ERROR] Build failed
    pause
    exit /b 1
)

echo.
echo [Step 2] Installing...
call install.bat
