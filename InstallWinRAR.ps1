$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

cls

# Definicja zmiennych
$winrarUrl = "https://www.win-rar.com/fileadmin/winrar-versions/winrar/winrar-x64-701pl.exe"
$file = "C:\Program Files\WinRAR\rarreg.key"
$app = "C:\Program Files\WinRAR\WinRAR.exe"

# Pobieranie i instalacja WinRar
Write-Host "Instalacja WinRAR."
$winrarInstaller = "$env:TEMP\winrar_setup.exe"
Invoke-WebRequest -Uri $winrarUrl -OutFile $winrarInstaller
Start-Process -FilePath $winrarInstaller -Wait
Remove-Item -Path $winrarInstaller

# Aktywacja WinRAR
Write-Host "Aktywacja WinRar"
irm https://raw.githubusercontent.com/jk-5/PS1Install/main/ActivateWinRAR.ps1 | iex
