$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

cls

$officeUrl = "https://raw.githubusercontent.com/jk-5/PS1Install/main/Files/Office_Installer.exe"

$officeInstaller = "$env:TEMP\Office_Installer.exe"
Invoke-WebRequest -Uri $officeUrl -OutFile $officeInstaller
Start-Process -FilePath $officeInstaller -Wait

if (Test-Path -Path $officeInstaller -PathType Leaf) {
Remove-Item -Path $officeInstaller
}
cls
exit