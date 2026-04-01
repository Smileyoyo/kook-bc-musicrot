@echo off

echo ========================================
echo   KOOK Music Bot - Setup
echo ========================================
echo.

cd /d "%~dp0"

REM Check Java
echo [1/3] Checking Java...
java -version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Java not found
    echo Please install Java 11 or higher
    echo Download: https://adoptium.net/
    echo.
    pause
    exit /b 1
)
echo [OK] Java found
echo.

REM Check gradle-wrapper.jar
echo [2/3] Checking Gradle Wrapper...
if not exist "gradle\wrapper\gradle-wrapper.jar" (
    echo [INFO] gradle-wrapper.jar not found
    echo Please download it manually:
    echo 1. Visit: https://github.com/gradle/gradle/raw/v8.5.0/gradle/wrapper/gradle-wrapper.jar
    echo 2. Save to: gradle\wrapper\gradle-wrapper.jar
    echo.
    echo OR use Maven to build:
    echo   mvn clean package
    echo.
    pause
    exit /b 1
)
echo [OK] Gradle Wrapper found
echo.

REM Ready to build
echo [3/3] Ready to build
echo.
echo You can now run:
echo   build.bat - Build the project
echo.
pause
