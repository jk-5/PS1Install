@echo off
@chcp 852

cls

REM Ustalamy zmienn� dla folderu
set "folderPath=%USERPROFILE%\Desktop\WiFi"

REM Tworzymy folder na pulpicie
mkdir "%folderPath%"

REM Eksportujemy profile sieci Wi-Fi do utworzonego folderu
netsh wlan export profile folder="%folderPath%" key=clear

REM Informacja o zako�czeniu
echo Eksportowanie profili Wi-Fi zako�czone. Zapisano w folderze: %folderPath%
pause
