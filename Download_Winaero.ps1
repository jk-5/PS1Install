$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

cls

$url = "https://dl.google.com/chrome/install/latest/chrome_installer.exe"  # Adres URL pliku do pobrania
$desktopPath = [Environment]::GetFolderPath("Desktop")
$destination = "$desktopPath\chrome.exe"

Invoke-WebRequest -Uri $url -OutFile $destination

cls
Write-Host "Pobrano plik i zapisano na pulpicie."