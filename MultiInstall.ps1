$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

cls

$multiUrl = "https://raw.githubusercontent.com/jk-5/PS1Install/main/Files/Multi_Installer.exe"

$multiInstaller = "$env:TEMP\Multi_Installer.exe"
Invoke-WebRequest -Uri $multiUrl -OutFile $multiInstaller
Start-Process -FilePath $multiInstaller -Wait

if (Test-Path -Path $multiInstaller -PathType Leaf) {
Remove-Item -Path $multiInstaller
}
cls
exit
