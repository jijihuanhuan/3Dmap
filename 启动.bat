@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo 3D 世界地图
echo 浏览器将打开 http://127.0.0.1:8760/globe.html
echo 关闭本窗口即停止服务。
echo.
start "" "http://127.0.0.1:8760/globe.html"
python -m http.server 8760 --bind 127.0.0.1
if errorlevel 1 (
  echo 未找到 Python，请先安装 Python 3，或用其他静态服务器打开本目录。
  pause
)
