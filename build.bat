@echo off

echo ========================================
echo   KOOK Music Bot - Build
echo ========================================
echo.

cd /d "%~dp0"

REM Check gradle-wrapper.jar
if not exist "gradle\wrapper\gradle-wrapper.jar" (
    echo [ERROR] gradle-wrapper.jar not found
    echo Please run: gradlew.bat
    echo.
    pause
    exit /b 1
)

REM Build
echo [1/2] Cleaning...
call gradlew.bat clean
echo [2/2] Building...
call gradlew.bat build

if errorlevel 1 (
    echo.
    echo [ERROR] Build failed
    pause
    exit /b 1
)

echo.
echo ========================================
echo   SUCCESS!
echo ========================================
echo Output: build\libs\kook-music-bot.jar
echo.

pause
