$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

cls

# Definicja zmiennych
$klitecodecpackUrl = "https://files3.codecguide.com/K-Lite_Codec_Pack_1860_Mega.exe"
$installDir = "C:\Program Files (x86)\K-Lite Codec Pack"
$app = "C:\Program Files (x86)\K-Lite Codec Pack\MPC-HC64\mpc-hc64.exe"

# Pobieranie i instalacja K-Lite Codec Pack Mega
Write-Host "Instalacja K-Lite Codec Pack Mega."
$klitecodecpackInstaller = "$env:TEMP\k_lite_codec_pack_setup.exe"
Invoke-WebRequest -Uri $klitecodecpackUrl -OutFile $klitecodecpackInstaller
Start-Process -FilePath $klitecodecpackInstaller -Wait
Remove-Item -Path $klitecodecpackInstaller

# Uruchomienie K-Lite Codec Pack Mega
cls
Write-Host "Instalacja K-Lite Codec Pack Mega ukończona."
Start-Process -FilePath $app
