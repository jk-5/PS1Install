@echo off
wevtutil.exe cl "Microsoft-Windows-Windows Defender/Operational"
rmdir /s /q "C:\ProgramData\Microsoft\Windows Defender\Scans\History\Service"