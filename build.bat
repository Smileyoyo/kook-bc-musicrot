@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ========================================
echo   KOOK Music Bot Build Script
echo ========================================
echo.

cd /d "%~dp0"
echo Current Directory: %CD%
echo.

REM Check Wrapper
if not exist "gradlew.bat" (
    echo [ERROR] gradlew.bat not found
    echo Please run in project root directory
    pause
    exit /b 1
)

REM Check gradle-wrapper.jar
if not exist "gradle\wrapper\gradle-wrapper.jar" (
    echo [ERROR] gradle-wrapper.jar not found
    echo.
    echo Please run: init-wrapper.bat
    echo.
    echo Or use Maven: build-maven.bat
    pause
    exit /b 1
)

REM Clean
echo [1/3] Cleaning...
call gradlew.bat clean
if errorlevel 1 (
    echo [ERROR] Clean failed
    pause
    exit /b 1
)
echo       Clean done
echo.

REM Build
echo [2/3] Building...
call gradlew.bat build
if errorlevel 1 (
    echo [ERROR] Build failed
    echo.
    echo Please check:
    echo   1. Java 11+ is installed
    echo   2. Network connection
    echo.
    pause
    exit /b 1
)
echo       Build done
echo.

REM Check output
echo [3/3] Checking output...
if not exist "build\libs\kook-music-bot.jar" (
    echo [ERROR] Output file not found
    pause
    exit /b 1
)
echo       Output: build\libs\kook-music-bot.jar
echo.

echo ========================================
echo   BUILD SUCCESS!
echo ========================================
echo.
echo Install:
echo   1. Copy build\libs\kook-music-bot.jar
echo   2. Paste to KookBC\modules\
echo   3. Run KookBC
echo.
echo Or run: install.bat
echo.

pause
