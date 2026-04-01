@echo off

echo ========================================
echo   KOOK Music Bot - Init Gradle
echo ========================================
echo.

cd /d "%~dp0"

REM Check if already exists
if exist "gradle\wrapper\gradle-wrapper.jar" (
    if exist "gradle\wrapper\gradle-wrapper.properties" (
        echo [OK] Gradle Wrapper already exists
        echo You can run: build.bat
        echo.
        pause
        exit /b 0
    )
)

REM Create directories
if not exist "gradle\wrapper" (
    echo [Creating] gradle\wrapper directory...
    mkdir gradle\wrapper
)

REM Download gradle-wrapper.jar
echo [1/2] Downloading gradle-wrapper.jar...
powershell -Command "& {Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/gradle/gradle/v8.5.0/gradle/wrapper/gradle-wrapper.jar' -OutFile 'gradle\wrapper\gradle-wrapper.jar'}"

if errorlevel 1 (
    echo [ERROR] Failed to download gradle-wrapper.jar
    pause
    exit /b 1
)

REM Download gradle-wrapper.properties
echo [2/2] Downloading gradle-wrapper.properties...
powershell -Command "& {Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/gradle/gradle/v8.5.0/gradle/wrapper/gradle-wrapper.properties' -OutFile 'gradle\wrapper\gradle-wrapper.properties'}"

if errorlevel 1 (
    echo [ERROR] Failed to download gradle-wrapper.properties
    pause
    exit /b 1
)

echo.
echo [Checking] downloads...
if exist "gradle\wrapper\gradle-wrapper.jar" (
    if exist "gradle\wrapper\gradle-wrapper.properties" (
        echo [SUCCESS] All files downloaded successfully
        echo.
        echo You can now run: build.bat
    ) else (
        echo [ERROR] gradle-wrapper.properties not found
    )
) else (
    echo [ERROR] gradle-wrapper.jar not found
)

echo.
pause
