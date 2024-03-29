$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

cls

$musicUrl = "https://raw.githubusercontent.com/jk-5/PS1Install/main/Files/music.mp3"

Write-Host "Pobieranie muzyki testowej."
$musicInstaller = "$env:TEMP\music.mp3"
Invoke-WebRequest -Uri $musicUrl -OutFile $musicInstaller
$desktopPath = [Environment]::GetFolderPath("Desktop")
$destinationPath = Join-Path -Path $desktopPath -ChildPath "\music.mp3"
Copy-Item -Path $musicInstaller -Destination $destinationPath
Remove-Item -Path $musicInstaller

cls
Write-Host "Pobieranie muzyki testowej ukończone."
