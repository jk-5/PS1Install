$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

cls

$videoUrl = "https://raw.githubusercontent.com/jk-5/PS1Install/main/Files/video.mp4"

Write-Host "Pobieranie filmu testowego."
$videoInstaller = "$env:TEMP\video.mp4"
Invoke-WebRequest -Uri $videoUrl -OutFile $videoInstaller
Start-Process -FilePath $videoInstaller -Wait
Remove-Item -Path $videoInstaller

cls
Write-Host "Pobieranie filmu testowego ukończone."