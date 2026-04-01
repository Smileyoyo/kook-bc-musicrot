@echo off
chcp 65001 >nul

echo ========================================
echo   KOOK Music Bot - Build & Install
echo ========================================
echo.

cd /d "%~dp0"

REM 编译
call build.bat

REM 安装
call install.bat
