@echo off

echo ========================================
echo   KOOK Music Bot - Build & Install
echo ========================================
echo.

cd /d "%~dp0"

REM Build
call build.bat

REM Install
call install.bat
