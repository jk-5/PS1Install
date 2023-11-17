$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

cls

$webUrl = "https://raw.githubusercontent.com/jk-5/PS1Install/main/Files/web.html"

Write-Host "Pobieranie strony testowej."
$webInstaller = "$env:TEMP\web.html"
Invoke-WebRequest -Uri $webUrl -OutFile $webInstaller
$desktopPath = [Environment]::GetFolderPath("Desktop")
$destinationPath = Join-Path -Path $desktopPath -ChildPath "\web.html"
Copy-Item -Path $webInstaller -Destination $destinationPath
Remove-Item -Path $webInstaller

cls
Write-Host "Pobieranie strony testowej ukończone."
