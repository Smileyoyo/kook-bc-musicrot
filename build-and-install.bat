@echo off
chcp 65001 >nul

echo ========================================
echo   KOOK 音乐机器人 - 一键编译安装
echo ========================================
echo.

REM 检查首次运行
if not exist "gradle\wrapper\gradle-wrapper.jar" (
    echo [提示] 首次运行，正在下载 Gradle Wrapper...
    echo 这可能需要几分钟，请耐心等待...
    echo.
)

REM 编译
echo [步骤 1] 编译项目...
call build.bat
if errorlevel 1 (
    echo.
    echo [错误] 编译失败
    pause
    exit /b 1
)

echo.
echo [步骤 2] 安装插件...
call install.bat
