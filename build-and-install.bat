@echo off

echo ========================================
echo   KOOK Music Bot - Build & Install
echo ========================================
echo.

cd /d "%~dp0"

REM Check if Gradle Wrapper files exist
echo [Checking] Gradle Wrapper...
set init_needed=0

if not exist "gradle\wrapper\gradle-wrapper.jar" (
    echo [MISSING] gradle-wrapper.jar
    set init_needed=1
)

if not exist "gradle\wrapper\gradle-wrapper.properties" (
    echo [MISSING] gradle-wrapper.properties
    set init_needed=1
)

if %init_needed%==1 (
    echo.
    echo [INFO] Running init-gradle.bat...
    call init-gradle.bat
    if errorlevel 1 (
        echo.
        echo [ERROR] Init failed
        echo Please check your network connection
        echo.
        pause
        exit /b 1
    )
    echo.
) else (
    echo [OK] All files found
    echo.
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
