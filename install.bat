@echo off

echo ========================================
echo   KOOK Music Bot - Install
echo ========================================
echo.

cd /d "%~dp0"

REM Check JAR (Gradle output)
if exist "build\libs\kook-music-bot.jar" (
    set jar_file=build\libs\kook-music-bot.jar
    goto install
)

REM Check JAR (Maven output)
if exist "target\kook-music-bot.jar" (
    set jar_file=target\kook-music-bot.jar
    goto install
)

REM Not found
echo [ERROR] JAR file not found
echo Please run: build.bat or build-maven.bat
pause
exit /b 1

:install
REM Copy to plugins
echo [Copying] to plugins folder...
copy /Y "!jar_file!" "plugins\" >nul

if errorlevel 1 (
    echo [Creating] plugins folder...
    mkdir plugins
    copy /Y "!jar_file!" "plugins\" >nul
)

echo.
echo ========================================
echo   SUCCESS!
echo ========================================
echo Installed from: !jar_file!
echo Installed to: plugins\kook-music-bot.jar
echo.

pause
