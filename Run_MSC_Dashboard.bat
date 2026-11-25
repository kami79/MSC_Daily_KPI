@echo off
setlocal
cd /d "%~dp0"

set "PY=python.exe"
if exist "C:\Users\kamiran.gabriel\Desktop\Subs_Dash\.venv\Scripts\python.exe" set "PY=C:\Users\kamiran.gabriel\Desktop\Subs_Dash\.venv\Scripts\python.exe"
if exist "%~dp0.venv\Scripts\python.exe" set "PY=%~dp0.venv\Scripts\python.exe"

set "NET_IP="
for /f "usebackq tokens=*" %%a in (`powershell -NoProfile -Command "(Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.InterfaceAlias -notlike '*Loopback*' -and $_.IPAddress -notlike '169.254*' } | Select-Object -First 1).IPAddress" 2^>nul`) do set "NET_IP=%%a"

echo =======================================================================
echo     KOREK TELECOM - MSC ^& MGW DAILY/HOURLY KPI MONITORING PORTAL
echo =======================================================================
echo.
echo Starting FastAPI Server on http://0.0.0.0:8081 ...
echo.
echo   [Local Access]     http://localhost:8081
if defined NET_IP (
    echo   [Company Network]  http://%NET_IP%:8081
)
echo   [Hostname Access]  http://%COMPUTERNAME%:8081
echo.
echo =======================================================================
echo.

start "" /b cmd /c "timeout /t 2 /nobreak >nul & start http://localhost:8081"

"%PY%" -m uvicorn dashboard.backend.app.main:app --host 0.0.0.0 --port 8081 --reload

if errorlevel 1 (
    echo.
    echo [ERROR] Dashboard server terminated unexpectedly.
    pause
    exit /b 1
)

pause

