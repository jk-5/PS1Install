$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

cls

# Definicja zmiennych
$WinaeroUrl = "https://winaero.com/downloads/winaerotweaker.zip"

# Pobieranie Winaero Tweaker
Write-Host "Pobieranie Winaero Tweaker."
$WinaeroInstaller = "$env:USERPROFILE\Desktop\winaerotweaker.zip"
Invoke-WebRequest -Uri $WinaeroUrl -OutFile $WinaeroInstaller

cls
Write-Host "Pobrano Winaero Tweaker. Plik znajdziesz na pulpicie."