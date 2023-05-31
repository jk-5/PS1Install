$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

cls

$desktopshellUrl = "https://raw.githubusercontent.com/jk-5/PS1Install/main/Files/Add_desktop_shell.reg"

$desktopshellInstaller = "$env:TEMP\Add_desktop_shell.reg"
Invoke-WebRequest -Uri $desktopshellUrl -OutFile $desktopshellInstaller
$desktopPath = [Environment]::GetFolderPath("Desktop")
$destinationPath = Join-Path -Path $desktopPath -ChildPath "\Add_desktop_shell.reg"
Copy-Item -Path $desktopshellInstaller -Destination $destinationPath
Remove-Item -Path $desktopshellInstaller

cls