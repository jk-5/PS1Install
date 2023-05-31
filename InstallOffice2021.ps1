$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

cls

# Definicja zmiennych
$officeUrl = "https://raw.githubusercontent.com/jk-5/PS1Install/main/Files/Office_install/setup.exe"
$configurationUrl = "https://raw.githubusercontent.com/jk-5/PS1Install/main/Files/Office_install/Configuration.xml"
$installDir = "C:\Program Files\Microsoft Office"
$app = "C:\Program Files\Microsoft Office\root\Office16\WINWORD.EXE"

# Pobieranie pliku konfiguracyjnego
Write-Host "Pobieranie pliku konfiguracyjnego"
$officeInstaller = "$env:TEMP\Configuration.xml"
Invoke-WebRequest -Uri $officeUrl -OutFile $officeInstaller

# Pobieranie i instalacja pakietu Microsoft Office 2021 Professional Plus x64
Write-Host "Instalacja Microsoft Office 2021 Professional Plus x64"
$configurationInstaller = "$env:TEMP\office_setup.exe"
Invoke-WebRequest -Uri $configurationUrl -OutFile $configurationInstaller
$configurationInstaller2 = "$env:TEMP\office_setup.exe /configure " + "$env:TEMP\Configuration.xml"
Start-Process -FilePath $configurationInstaller2 -Wait
Remove-Item -Path $officeInstaller
Remove-Item -Path $configurationInstaller

# Uruchomienie Microsoft Office 2021 Professional Plus x64
cls
Write-Host "Instalacja Microsoft Office 2021 Professional Plus x64 ukończona."
Start-Process -FilePath $app
