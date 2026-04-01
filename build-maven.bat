@echo off

echo ========================================
echo   KOOK Music Bot - Maven Build
echo ========================================
echo.

cd /d "%~dp0"

REM Check Maven
echo [1/3] Checking Maven...
call mvn -version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Maven not found
    echo Please install Maven 3.8 or higher
    echo Download: https://maven.apache.org/download.cgi
    echo.
    pause
    exit /b 1
)
echo [OK] Maven found
echo.

REM Clean
echo [2/3] Cleaning...
call mvn clean

REM Build
echo [3/3] Building...
call mvn package -DskipTests

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
echo Output: target\kook-music-bot.jar
echo.
echo Now run: install.bat
echo.

pause
