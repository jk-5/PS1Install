$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

cls

$notepadUrl = "https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.6.4/npp.8.6.4.portable.x64.zip"

Write-Host "Pobieranie Notepad++ Portable."
$notepadInstaller = "$env:TEMP\notepad_portable.zip"
Invoke-WebRequest -Uri $notepadUrl -OutFile $notepadInstaller
$desktopPath = [Environment]::GetFolderPath("Desktop")
$destinationPath = Join-Path -Path $desktopPath -ChildPath "\notepad_portable.zip"
Copy-Item -Path $notepadInstaller -Destination $destinationPath
Remove-Item -Path $notepadInstaller

cls
Write-Host "Pobieranie Notepad++ Portable ukończone. Plik znajdziesz na pulpicie."
