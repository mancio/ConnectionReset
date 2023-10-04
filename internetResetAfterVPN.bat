@echo off

REM Check if the script is running with administrator privileges
NET SESSION >nul 2>&1
if %errorLevel% neq 0 (
    echo Please run this script as an administrator.
    timeout 5
    exit /b 1
)

REM reset connection and restart
ipconfig /release
timeout 5
ipconfig /flushdns
timeout 5
ipconfig /renew
timeout 5
netsh int ip reset
timeout 5
netsh winsock reset
timeout 5
shutdown /r /t 0
