@echo off
@chcp 852
:MENU
cls
echo 浜様様様様様様様様様様様様様様様様�
echo �         Wybierz z listy         �
echo 麺様様様様様様様様様様様様様様様様�
echo � 1) Z GUI                        �
echo � 2) Bez GUI                      �
echo 藩様様様様様様様様様様様様様様様様�
echo.
set /p choice=Wybierz: 

if "%choice%"=="1" powershell -Command "irm https://raw.githubusercontent.com/jk-5/PS1Install/main/MultiInstall.ps1 | iex"
if "%choice%"=="2" powershell -Command "irm https://raw.githubusercontent.com/jk-5/PS1Install/main/MultiInstall2.ps1 | iex"
if "%choice%"=="0" exit
goto MENU
