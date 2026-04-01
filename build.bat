@echo off

echo ========================================
echo   KOOK Music Bot - Build
echo ========================================
echo.

cd /d "%~dp0"

REM Check if Gradle Wrapper files exist
if not exist "gradle\wrapper\gradle-wrapper.jar" (
    if not exist "gradle\wrapper\gradle-wrapper.properties" (
        echo [INFO] Gradle Wrapper not initialized
        echo.
        echo Please run: init-gradle.bat
        echo This will download the necessary files.
        echo.
        pause
        exit /b 1
    )
)

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
