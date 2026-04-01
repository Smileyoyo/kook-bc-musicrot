@echo off
chcp 65001 >nul

echo ========================================
echo   KOOK Music Bot - Install
echo ========================================
echo.

cd /d "%~dp0"

REM 检查 JAR
if not exist "build\libs\kook-music-bot.jar" (
    echo [错误] 未找到编译好的文件
    echo 请先运行: build.bat
    pause
    exit /b 1
)

REM 复制到 plugins
echo [复制] 到 plugins 文件夹...
copy /Y "build\libs\kook-music-bot.jar" "plugins\" >nul

if errorlevel 1 (
    echo [创建] plugins 文件夹...
    mkdir plugins
    copy /Y "build\libs\kook-music-bot.jar" "plugins\" >nul
)

echo.
echo ========================================
echo   成功！
echo ========================================
echo 已安装到: plugins\kook-music-bot.jar
echo.

pause
