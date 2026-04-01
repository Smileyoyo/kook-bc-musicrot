@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ========================================
echo   KOOK 音乐机器人安装脚本 (Maven)
echo ========================================
echo.

cd /d "%~dp0"
echo 当前目录: %CD%
echo.

REM 检查 JAR 文件
if not exist "target\kook-music-bot.jar" (
    echo [错误] 未找到编译好的文件
    echo 请先运行 build-maven.bat 编译项目
    pause
    exit /b 1
)

REM 询问 KookBC 目录
echo 请输入 KookBC 的安装目录:
echo 例如: C:\KookBC
echo.
set /p kookbc_dir="KookBC 目录: "

REM 去除引号
set kookbc_dir=!kookbc_dir:"=!

REM 检查目录是否存在
if not exist "!kookbc_dir!" (
    echo [错误] 目录不存在: !kookbc_dir!
    pause
    exit /b 1
)

REM 检查 modules 目录
set modules_dir=!kookbc_dir!\modules
if not exist "!modules_dir!" (
    echo [错误] 未找到 modules 目录: !modules_dir!
    echo 请确认这是 KookBC 的安装目录
    pause
    exit /b 1
)

REM 复制文件
echo.
echo 正在复制文件...
copy /Y "target\kook-music-bot.jar" "!modules_dir!\" >nul

if errorlevel 1 (
    echo [错误] 复制失败
    pause
    exit /b 1
)

echo.
echo ========================================
echo   安装成功！
echo ========================================
echo.
echo 文件已复制到: !modules_dir!\kook-music-bot.jar
echo.
echo 下一步:
echo   1. 启动 KookBC
echo   2. 检查是否成功加载插件
echo.

pause
