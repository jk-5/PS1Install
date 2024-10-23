@echo off
@chcp 852

cls

REM Ustalamy zmienn¥ dla folderu
set "folderPath=%USERPROFILE%\Desktop\WiFi"

REM Sprawdzamy, czy folder istnieje
if exist "%folderPath%" (
    REM Przechodzimy przez wszystkie pliki XML w folderze
    for %%f in ("%folderPath%\*.xml") do (
        echo Importowanie profilu: %%~nxf
        netsh wlan add profile filename="%%f"
    )
    echo Importowanie profili Wi-Fi zakoäczone.
) else (
    echo Folder "%folderPath%" nie istnieje. Sprawd«, czy zostaˆ utworzony wcze˜niej.
)

pause
