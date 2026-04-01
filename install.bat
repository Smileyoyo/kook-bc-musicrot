@echo off

echo ========================================
echo   KOOK Music Bot - Install
echo ========================================
echo.

cd /d "%~dp0"

REM Check JAR
if not exist "build\libs\kook-music-bot.jar" (
    echo [ERROR] Build not found
    echo Please run: build.bat
    pause
    exit /b 1
)

REM Copy to plugins
echo [Copying] to plugins folder...
copy /Y "build\libs\kook-music-bot.jar" "plugins\" >nul

if errorlevel 1 (
    echo [Creating] plugins folder...
    mkdir plugins
    copy /Y "build\libs\kook-music-bot.jar" "plugins\" >nul
)

echo.
echo ========================================
echo   SUCCESS!
echo ========================================
echo Installed to: plugins\kook-music-bot.jar
echo.

pause
