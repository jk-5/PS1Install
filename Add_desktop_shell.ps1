$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

# Ustawienie kodowania na UTF-8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

cls

$shellUrl = "https://raw.githubusercontent.com/jk-5/PS1Install/main/Files/Add_desktop_shell.reg"

$shellInstaller = "$env:TEMP\Add_desktop_shell.reg"
Invoke-WebRequest -Uri $shellUrl -OutFile $shellInstaller
$desktopPath = [Environment]::GetFolderPath("Desktop")
$destinationPath = Join-Path -Path $desktopPath -ChildPath "\Add_desktop_shell.reg"
Copy-Item -Path $shellInstaller -Destination $destinationPath
Remove-Item -Path $shellInstaller

cls
Write-Host "Pobieranie ustawień ukończone."