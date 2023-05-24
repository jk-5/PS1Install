$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

cls

# Definicja zmiennych
$teamviewerUrl = "https://download.teamviewer.com/download/TeamViewer_Setup_x64.exe"
$installDir = "C:\Program Files\TeamViewer"
$app = "C:\Program Files\TeamViewer\TeamViewer.exe"

# Pobieranie i instalacja TeamViewer
Write-Host "Instalacja TeamViewer."
$teamviewerInstaller = "$env:TEMP\teamviewer_setup.exe"
Invoke-WebRequest -Uri $teamviewerUrl -OutFile $teamviewerInstaller
Start-Process -FilePath $teamviewerInstaller -Wait
Remove-Item -Path $teamviewerInstaller

# Zmiana interfejscu na klasyczny
Set-ItemProperty -Path "HKCU:\SOFTWARE\TeamViewer" -Name "UIVersion" -Value 2

# Uruchomienie TeamViewer
cls
Write-Host "Instalacja TeamViewer ukończona."
Start-Process -FilePath $app
