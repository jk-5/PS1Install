$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

cls

# Definicja zmiennych
$ccleanerUrl = "https://download.ccleaner.com/portable/ccsetup612.zip"

# Pobieranie ccleaner Tweaker
Write-Host "Pobieranie CCleaner."
$ccleanerInstaller = "$env:TEMP\ccleaner_portable.zip"
Invoke-WebRequest -Uri $ccleanerUrl -OutFile $ccleanerInstaller
$destinationPath = Join-Path [Environment]::GetFolderPath("Desktop") "\\ccleaner_portable.zip"
Copy-Item -Path $ccleanerInstaller -Destination $destinationPath
Remove-Item -Path $ccleanerInstaller

# Uruchomienie ccleaner
cls
Write-Host "Pobieranie CCleaner Portable ukończone. Plik znajdziesz na pulpicie."