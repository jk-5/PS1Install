@echo off
@chcp 852
:MENU
cls
echo ���������������������������������ͻ
echo �         Wybierz z listy         �
echo ���������������������������������͹
echo � 1) Z GUI                        �
echo � 2) Bez GUI                      �
echo ���������������������������������ͼ
echo.
set /p choice=Wybierz: 

if "%choice%"=="1" powershell -Command "irm https://raw.githubusercontent.com/jk-5/PS1Install/main/MultiInstall.ps1 | iex"
if "%choice%"=="2" powershell -Command "irm https://raw.githubusercontent.com/jk-5/PS1Install/main/MultiInstall2.ps1 | iex"
if "%choice%"=="0" exit
goto MENU
