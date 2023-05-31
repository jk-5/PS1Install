$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

cls

# Definicja zmiennych
$officeUrl = "https://raw.githubusercontent.com/jk-5/PS1Install/main/Files/Office_install/setup.exe"
$configurationUrl = "https://raw.githubusercontent.com/jk-5/PS1Install/main/Files/Office_install/Configuration.xml"
$setupUrl = "https://raw.githubusercontent.com/jk-5/PS1Install/main/Files/Office_install/Install.bat"
$installDir = "C:\Program Files\Microsoft Office"
$app = "C:\Program Files\Microsoft Office\root\Office16\WINWORD.EXE"

# Pobieranie pliku konfiguracyjnego
Write-Host "Pobieranie instalatora"
$officeInstaller = "$env:TEMP\office_setup.exe"
Invoke-WebRequest -Uri $officeUrl -OutFile $officeInstaller

# Pobieranie instalatora pakietu Microsoft Office 2021 Professional Plus x64
Write-Host "Pobieranie pliku konfiguracyjnego"
$configurationInstaller = "$env:TEMP\Configuration.xml"
Invoke-WebRequest -Uri $configurationUrl -OutFile $configurationInstaller

# Pobieranie i instalacja pakietu Microsoft Office 2021 Professional Plus x64
Write-Host "Instalacja Microsoft Office 2021 Professional Plus x64"
$setupInstaller = "$env:TEMP\Install.cmd"
Invoke-WebRequest -Uri $setupUrl -OutFile $setupInstaller
Start-Process -FilePath $setupInstaller -Wait

# Uruchomienie Microsoft Office 2021 Professional Plus x64
cls
Write-Host "Instalacja Microsoft Office 2021 Professional Plus x64 ukończona."
Start-Process -FilePath $app
