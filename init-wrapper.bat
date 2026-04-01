@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ========================================
echo   初始化 Gradle Wrapper
echo ========================================
echo.

cd /d "%~dp0"
echo 当前目录: %CD%
echo.

REM 检查是否已存在
if exist "gradle\wrapper\gradle-wrapper.jar" (
    echo [提示] Gradle Wrapper 已存在
    echo 可以直接运行: build.bat
    echo.
    pause
    exit /b 0
)

echo [1/2] 下载 Gradle Wrapper...
echo.

REM 使用 curl 下载
curl -L -o gradle-wrapper.jar https://raw.githubusercontent.com/gradle/gradle/v8.5.0/gradle/wrapper/gradle-wrapper.jar

if errorlevel 1 (
    echo [错误] 下载失败
    echo.
    echo 请手动下载：
    echo 1. 访问: https://raw.githubusercontent.com/gradle/gradle/v8.5.0/gradle/wrapper/gradle-wrapper.jar
    echo 2. 保存到: gradle\wrapper\gradle-wrapper.jar
    echo.
    echo 或者使用 Maven 编译：
    echo   build-maven.bat
    echo.
    pause
    exit /b 1
)

echo [2/2] 移动文件到正确位置...
move /Y gradle-wrapper.jar gradle\wrapper\ >nul

if errorlevel 1 (
    echo [错误] 移动文件失败
    pause
    exit /b 1
)

echo.
echo ========================================
echo   初始化成功！
echo ========================================
echo.
echo 现在可以运行:
echo   build.bat
echo   build-and-install.bat
echo.

pause
