$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

cls

$ccleanerUrl = "https://download.ccleaner.com/portable/ccsetup612.zip"

Write-Host "Pobieranie CCleaner Portable."
$ccleanerInstaller = "$env:TEMP\ccleaner_portable.zip"
Invoke-WebRequest -Uri $ccleanerUrl -OutFile $ccleanerInstaller
$desktopPath = [Environment]::GetFolderPath("Desktop")
$destinationPath = Join-Path -Path $desktopPath -ChildPath "\ccleaner_portable.zip"
Copy-Item -Path $ccleanerInstaller -Destination $destinationPath
Remove-Item -Path $ccleanerInstaller

cls
Write-Host "Pobieranie CCleaner Portable ukończone. Plik znajdziesz na pulpicie."
