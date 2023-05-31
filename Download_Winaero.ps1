$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

cls

$url = "https://winaerotweaker.com/download/winaerotweaker.zip"  # Adres URL pliku do pobrania
$desktopPath = [Environment]::GetFolderPath("Desktop")
$destination = "$desktopPath\winaerotweaker.zip"

Invoke-WebRequest -Uri $url -OutFile $destination

cls
Write-Host "Pobrano plik i zapisano na pulpicie."