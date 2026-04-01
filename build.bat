@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ========================================
echo   KOOK 音乐机器人编译脚本
echo ========================================
echo.

cd /d "%~dp0"
echo 当前目录: %CD%
echo.

REM 检查 Gradle Wrapper
if not exist "gradlew.bat" (
    echo [错误] 未找到 gradlew.bat
    echo 请确保在项目根目录运行此脚本
    pause
    exit /b 1
)

REM 清理之前的构建
echo [1/3] 清理之前的构建...
call gradlew.bat clean
if errorlevel 1 (
    echo [错误] 清理失败
    pause
    exit /b 1
)
echo       清理完成
echo.

REM 编译项目
echo [2/3] 编译项目...
call gradlew.bat build
if errorlevel 1 (
    echo [错误] 编译失败
    echo.
    echo 请检查：
    echo   1. 是否已安装 Java 11 或更高版本
    echo   2. 是否已安装 JKook API 到本地 Maven 仓库
    echo.
    pause
    exit /b 1
)
echo       编译完成
echo.

REM 检查输出文件
echo [3/3] 检查输出文件...
if not exist "build\libs\kook-music-bot.jar" (
    echo [错误] 未找到输出文件
    pause
    exit /b 1
)
echo       输出文件: build\libs\kook-music-bot.jar
echo.

echo ========================================
echo   编译成功！
echo ========================================
echo.
echo 安装方法：
echo   1. 复制 build\libs\kook-music-bot.jar
echo   2. 粘贴到 KookBC 的 modules 目录
echo   3. 启动 KookBC
echo.
echo 或者直接运行:
echo   install.bat
echo.

pause
