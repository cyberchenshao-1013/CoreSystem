@echo off
cd /d "%~dp0"
powershell.exe -NoExit -ExecutionPolicy Bypass -NoProfile -Command "Set-Location -LiteralPath '%~dp0'; Write-Host 'Done: switched to the current project directory and launched a PowerShell session with ExecutionPolicy Bypass enabled.'"
exit /b 0
