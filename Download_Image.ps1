$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

cls

$imageUrl = "https://raw.githubusercontent.com/jk-5/PS1Install/main/Files/image.jpg"

Write-Host "Pobieranie grafiki testowej."
$imageInstaller = "$env:TEMP\image.jpg"
Invoke-WebRequest -Uri $imageUrl -OutFile $imageInstaller
Start-Process -FilePath $imageInstaller -Wait
Remove-Item -Path $imageInstaller

cls
Write-Host "Pobieranie grafiki testowej ukończone."