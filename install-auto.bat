@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ========================================
echo   KOOK 音乐机器人 - 自动安装
echo ========================================
echo.

cd /d "%~dp0"
echo 当前目录: %CD%
echo.

REM 检查 JAR 文件
if not exist "build\libs\kook-music-bot.jar" (
    echo [错误] 未找到编译好的文件
    echo 请先运行: build.bat
    pause
    exit /b 1
)

REM 自动查找 KookBC
echo 正在查找 KookBC...
echo.

REM 检查父目录
if exist "..\kookbc-0.33.0.jar" (
    set kookbc_dir=..\
    echo [找到] 在父目录找到 KookBC
    goto install
)

REM 检查当前目录
if exist "kookbc-0.33.0.jar" (
    set kookbc_dir=%CD%\
    echo [找到] 在当前目录找到 KookBC
    goto install
)

REM 未找到，询问用户
echo [未找到] 未自动找到 KookBC
echo.
echo 请输入 KookBC 所在的目录（包含 kookbc-0.33.0.jar 的目录）
echo 例如: E:\后台\后台\kookbot
echo.
set /p kookbc_dir="KookBC 目录: "

REM 去除引号
set kookbc_dir=!kookbc_dir:"=!

:install
echo.
echo 正在安装...
echo.

REM 创建 modules 目录
set modules_dir=!kookbc_dir!\modules
if not exist "!modules_dir!" (
    echo [创建] modules 目录: !modules_dir!
    mkdir "!modules_dir!"
)

REM 复制文件
echo [复制] kook-music-bot.jar
copy /Y "build\libs\kook-music-bot.jar" "!modules_dir!\" >nul

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
echo   1. cd /d "!kookbc_dir!"
echo   2. java -jar kookbc-0.33.0.jar
echo.

pause
