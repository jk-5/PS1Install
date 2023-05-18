$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

cls

# Definicja zmiennych
$acrordrUrl = "https://raw.githubusercontent.com/jk-5/PS1Install/main/Files/readerdc64_pl_ha_crd_mdr_install.exe"
$installDir = "C:\Program Files\Adobe\Acrobat DC\Acrobat"
$app = "C:\Program Files\Adobe\Acrobat DC\Acrobat\Acrobat.exe"

# Pobieranie i instalacja Adobe Acrobat Reader DC
Write-Host "Instalacja Adobe Acrobat Reader DC."
$acrordrInstaller = "$env:TEMP\acrobat_reader_dc_setup.exe"
Invoke-WebRequest -Uri $acrordrUrl -OutFile $acrordrInstaller
Start-Process -FilePath $acrordrInstaller -Wait
Remove-Item -Path $acrordrInstaller

# Uruchomienie Adobe Acrobat Reader DC
cls
Write-Host "Instalacja Adobe Acrobat Reader DC ukończona."
