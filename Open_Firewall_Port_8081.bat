@echo off
echo Opening Windows Firewall TCP Port 8081 for MSC_Daily_KPI Portal...
netsh advfirewall firewall delete rule name="MSC_Daily_KPI_Portal_8081" >nul 2>&1
netsh advfirewall firewall add rule name="MSC_Daily_KPI_Portal_8081" dir=in action=allow protocol=TCP localport=8081 profile=any
if %errorlevel% equ 0 (
    echo [OK] Port 8081 is now open for company network access.
) else (
    echo [ERROR] Please right-click and "Run as administrator".
)
pause

