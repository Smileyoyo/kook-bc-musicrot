@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ========================================
echo   环境检查
echo ========================================
echo.

REM 检查 Java
echo [1/3] 检查 Java 环境...
java -version >nul 2>&1
if errorlevel 1 (
    echo [错误] 未找到 Java
    echo 请安装 Java 11 或更高版本
    echo 下载地址: https://adoptium.net/
    pause
    exit /b 1
)

for /f "tokens=3" %%i in ('java -version 2^>^&1 ^| findstr /i "version"') do (
    set java_ver=%%i
)
echo [成功] Java 版本: !java_ver!
echo.

REM 检查 Java 版本
echo [2/3] 检查 Java 版本...
java -version 2>&1 | findstr /i "11 12 13 14 15 16 17 18 19 20 21" >nul
if errorlevel 1 (
    echo [错误] Java 版本过低
    echo 需要的版本: Java 11 或更高
    echo 当前版本: !java_ver!
    pause
    exit /b 1
)
echo [成功] Java 版本符合要求
echo.

REM 检查 Gradle
echo [3/3] 检查 Gradle...
if exist "gradlew.bat" (
    echo [成功] 找到 Gradle Wrapper
) else (
    echo [错误] 未找到 Gradle Wrapper
    echo 请确保在项目根目录运行
    pause
    exit /b 1
)
echo.

echo ========================================
echo   环境检查通过！
echo ========================================
echo.
echo 可以开始编译项目了
echo 运行: build.bat 或 build-and-install.bat
echo.

pause
