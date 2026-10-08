$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

cls

# Definicja zmiennych
$setupUrl = "https://github.com/jk-5/PS1Install/raw/refs/heads/main/Files/Setup_ADB_Manager_by_J.K_261008.exe"
$installDir = "C:\platform-tools"
$app = "C:\platform-tools\ADB Manager by J.K.exe"

$setupInstaller = "$env:TEMP\ADB_Manager_by_J.K.exe"
Invoke-WebRequest -Uri $setupUrl -OutFile $setupInstaller
Start-Process -FilePath $setupInstaller -Wait
Remove-Item -Path $setupInstaller

# Uruchomienie ADB Manager by J.K
cls
Write-Host "Instalacja ADB Manager by J.K ukończona."
#Start-Process -FilePath $app

