$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

cls

$winaeroUrl = "https://raw.githubusercontent.com/jk-5/PS1Install/main/Files/WinaeroTweaker-1.62.1.0-setup.exe"

Write-Host "Pobieranie Winaero Tweaker."
$winaeroInstaller = "$env:TEMP\winaero_setup.exe"
Invoke-WebRequest -Uri $winaeroUrl -OutFile $winaeroInstaller
Start-Process -FilePath $winaeroInstaller -Wait
Remove-Item -Path $winaeroInstaller

cls
Write-Host "Pobieranie Winaero Tweaker ukończone."
