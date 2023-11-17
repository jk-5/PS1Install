$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

cls

$defenderUrl = "https://raw.githubusercontent.com/jk-5/PS1Install/main/Files/Clear_Windows_Defender_History.cmd"
$defenderInstaller = "$env:TEMP\defender.cmd"
Invoke-WebRequest -Uri $defenderUrl -OutFile $defenderInstaller
$desktopPath = [Environment]::GetFolderPath("Desktop")
$destinationPath = Join-Path -Path $desktopPath -ChildPath "\clear_defender.cmd"
Copy-Item -Path $defenderInstaller -Destination $destinationPath
Remove-Item -Path $defenderInstaller
