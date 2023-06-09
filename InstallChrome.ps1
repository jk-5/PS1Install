$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

cls

# Definicja zmiennych
$chromeUrl = "https://dl.google.com/chrome/install/latest/chrome_installer.exe"
$installDir = "C:\Program Files\Google\Chrome"
$app = "C:\Program Files\Google\Chrome\Application\chrome.exe"

# Pobieranie i instalacja Chrome
Write-Host "Instalacja Chrome."
$chromeInstaller = "$env:TEMP\chrome_setup.exe"
Invoke-WebRequest -Uri $chromeUrl -OutFile $chromeInstaller
Start-Process -FilePath $chromeInstaller -Wait
Remove-Item -Path $chromeInstaller

# Uruchomienie Chrome
cls
Write-Host "Instalacja Chrome ukończona."
