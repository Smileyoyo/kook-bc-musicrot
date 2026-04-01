@echo off
chcp 65001 >nul

echo ========================================
echo   KOOK Music Bot - Build and Install
echo ========================================
echo.

REM Check gradle-wrapper.jar
if not exist "gradle\wrapper\gradle-wrapper.jar" (
    echo [WARNING] gradle-wrapper.jar not found
    echo Running init-wrapper.bat first...
    echo.
    call init-wrapper.bat
    if errorlevel 1 (
        echo.
        echo [ERROR] Init failed
        echo Try Maven instead: build-maven.bat
        pause
        exit /b 1
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
