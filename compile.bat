@echo off

echo ========================================
echo   KOOK Music Bot - Java Compile
echo ========================================
echo.

cd /d "%~dp0"

REM 查找 KookBC jar
echo [1/4] Looking for KookBC...
set KOOKBC_JAR=
if exist "..\kookbc-0.33.0.jar" set KOOKBC_JAR=..\kookbc-0.33.0.jar
if exist "E:\后台\后台\kookbot\kookbc-0.33.0.jar" set KOOKBC_JAR=E:\后台\后台\kookbot\kookbc-0.33.0.jar

if "%KOOKBC_JAR%"=="" (
    echo [INFO] KookBC jar not found in common locations
    echo.
    echo Please enter path to kookbc-0.33.0.jar:
    set /p KOOKBC_JAR=
)

if not exist "%KOOKBC_JAR%" (
    echo [ERROR] KookBC jar not found: %KOOKBC_JAR%
    pause
    exit /b 1
)

echo [OK] Found: %KOOKBC_JAR%
echo.

REM 设置变量
set JAVA_HOME=C:\Program Files\Java\jdk-11
set SRC_DIR=src\main\java
set BUILD_DIR=build\classes
set LIB_DIR=lib

REM 创建目录
if not exist "%BUILD_DIR%" mkdir "%BUILD_DIR%"
if not exist "%LIB_DIR%" mkdir "%LIB_DIR%"

REM 复制 KookBC jar
echo [2/4] Copying KookBC jar...
copy /Y "%KOOKBC_JAR%" lib\kookbc.jar >nul

REM 下载其他依赖
echo [3/4] Downloading dependencies...
echo.

echo Downloading Gson...
powershell -Command "& {[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://repo1.maven.org/maven2/com/google/code/gson/gson/2.10.1/gson-2.10.1.jar' -OutFile '%LIB_DIR%\gson-2.10.1.jar'}"

echo Downloading Commons Lang3...
powershell -Command "& {[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://repo1.maven.org/maven2/org/apache/commons/commons-lang3/3.14.0/commons-lang3-3.14.0.jar' -OutFile '%LIB_DIR%\commons-lang3-3.14.0.jar'}"

echo Downloading SLF4J...
powershell -Command "& {[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://repo1.maven.org/maven2/org/slf4j/slf4j-api/2.0.9/slf4j-api-2.0.9.jar' -OutFile '%LIB_DIR%\slf4j-api-2.0.9.jar'}"

REM 编译
echo [4/4] Compiling...
echo.

"%JAVA_HOME%\bin\javac" -encoding UTF-8 -source 11 -target 11 -d "%BUILD_DIR%" -cp "%LIB_DIR%\*" "%SRC_DIR%\com\smileyoyo\kook\music\**\*.java"

if errorlevel 1 (
    echo.
    echo [ERROR] Compilation failed
    echo.
    echo Please check the error messages above
    pause
    exit /b 1
)

echo.
echo ========================================
echo   SUCCESS!
echo ========================================
echo.

REM 创建 jar
echo Creating JAR file...
"%JAVA_HOME%\bin\jar" cvf build\kook-music-bot.jar -C "%BUILD_DIR%" .

REM 复制到 plugins
if not exist "plugins" mkdir plugins
copy /Y build\kook-music-bot.jar plugins\ >nul

echo.
echo Output: build\kook-music-bot.jar
echo Installed to: plugins\kook-music-bot.jar
echo.

pause
