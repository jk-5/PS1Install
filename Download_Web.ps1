$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

cls

$webUrl = "https://raw.githubusercontent.com/jk-5/PS1Install/main/Files/web.html"

Write-Host "Pobieranie strony testowej."
$webInstaller = "$env:TEMP\web.html"
Invoke-WebRequest -Uri $webUrl -OutFile $webInstaller
Start-Process -FilePath $webInstaller -Wait
Remove-Item -Path $webInstaller

cls
Write-Host "Pobieranie strony testowej ukończone."
