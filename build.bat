@echo off

echo ========================================
echo   KOOK Music Bot - Build
echo ========================================
echo.

cd /d "%~dp0"

REM Check if Gradle Wrapper files exist
echo [Checking] Gradle Wrapper...
if not exist "gradle\wrapper\gradle-wrapper.jar" (
    echo [MISSING] gradle-wrapper.jar
    echo.
    goto init_needed
)

if not exist "gradle\wrapper\gradle-wrapper.properties" (
    echo [MISSING] gradle-wrapper.properties
    echo.
    goto init_needed
)

echo [OK] All files found
echo.

REM Build
echo [1/2] Cleaning...
call gradlew.bat clean
if errorlevel 1 (
    echo [ERROR] Clean failed
    pause
    exit /b 1
)

echo [2/2] Building...
call gradlew.bat build
if errorlevel 1 (
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
exit /b 0

:init_needed
echo [INFO] Gradle Wrapper files are missing
echo.
echo Please run: init-gradle.bat
echo This will download the necessary files.
echo.
pause
exit /b 1
