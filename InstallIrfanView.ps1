$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

cls

# Definicja zmiennych
$langUrl = "https://www.irfanview.net/lang/irfanview_lang_polski.exe"
$installDir = "C:\Program Files\IrfanView"
$app = "C:\Program Files\IrfanView\i_view64.exe"

$langInstaller = "$env:TEMP\irfanview_lang_setup.exe"
Invoke-WebRequest -Uri $langUrl -OutFile $langInstaller
Start-Process -FilePath $langInstaller -Wait
Remove-Item -Path $langInstaller

# Uruchomienie IrfanView
cls
Write-Host "Instalacja IrfanView ukończona."
Start-Process -FilePath $app

