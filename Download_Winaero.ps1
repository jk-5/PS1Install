$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

cls

$url = "https://winaero.com/downloads/winaerotweaker.zip"  # Adres URL pliku do pobrania
$desktopPath = [Environment]::GetFolderPath("Desktop")
$destination = Join-Path $desktopPath "winaerotweaker.zip"

$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $destination)

cls
Write-Host "Pobrano plik i zapisano na pulpicie."