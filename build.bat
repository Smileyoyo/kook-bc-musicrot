@echo off
chcp 65001 >nul

echo ========================================
echo   KOOK Music Bot - Build
echo ========================================
echo.

cd /d "%~dp0"

REM 检查 gradle-wrapper.jar
if not exist "gradle\wrapper\gradle-wrapper.jar" (
    echo [错误] 缺少 gradle-wrapper.jar
    echo 请运行: gradlew.bat
    echo.
    pause
    exit /b 1
)

REM 编译
echo [1/2] 清理...
call gradlew.bat clean
echo [2/2] 编译...
call gradlew.bat build

if errorlevel 1 (
    echo.
    echo [错误] 编译失败
    pause
    exit /b 1
)

echo.
echo ========================================
echo   成功！
echo ========================================
echo 输出: build\libs\kook-music-bot.jar
echo.

pause
