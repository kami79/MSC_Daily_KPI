@echo off
setlocal
cd /d "%~dp0"

set "PY=python.exe"
if exist "C:\Users\kamiran.gabriel\Desktop\Subs_Dash\.venv\Scripts\python.exe" set "PY=C:\Users\kamiran.gabriel\Desktop\Subs_Dash\.venv\Scripts\python.exe"
if exist "%~dp0.venv\Scripts\python.exe" set "PY=%~dp0.venv\Scripts\python.exe"

"%PY%" scripts\sync_msc_kpis.py
pause

