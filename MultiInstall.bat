@echo off
@chcp 852
:MENU
cls
echo ษอออออออออออออออออออออออออออออออออป
echo บ         Wybierz z listy         บ
echo ฬอออออออออออออออออออออออออออออออออน
echo บ 1) Z GUI                        บ
echo บ 2) Bez GUI                      บ
echo ศอออออออออออออออออออออออออออออออออผ
echo.
set /p choice=Wybierz: 

if "%choice%"=="1" powershell -Command "irm https://raw.githubusercontent.com/jk-5/PS1Install/main/MultiInstall.ps1 | iex"
if "%choice%"=="2" powershell -Command "irm https://raw.githubusercontent.com/jk-5/PS1Install/main/MultiInstall2.ps1 | iex"
if "%choice%"=="0" exit
goto MENU
