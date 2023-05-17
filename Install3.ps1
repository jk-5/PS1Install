$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

cls

# Definicja zmiennych
$irfanviewUrl = "https://download.instalki.org/programy/Windows/Grafika/przegladarki_grafiki/iview462_x64_setup.exe"
$pluginsUrl = "http://www.storage.programosy.pl/iview462_plugins_x64_setup.exe"
$langUrl = "https://www.irfanview.net/lang/irfanview_lang_polski.exe"
$installDir = "C:\Program Files\IrfanView"
$app = "C:\Program Files\IrfanView\i_view64.exe"

# Pobieranie i instalacja IrfanView
Write-Host "Instalacja IrfanView 1/3."
$irfanviewInstaller = "$env:TEMP\irfanview_setup.exe"
Invoke-WebRequest -Uri $irfanviewUrl -OutFile $irfanviewInstaller
Start-Process -FilePath $irfanviewInstaller -Wait
Remove-Item -Path $irfanviewInstaller

# Pobieranie i instalacja IrfanView Plugins
Write-Host "Instalacja IrfanView 2/3."
$pluginsInstaller = "$env:TEMP\irfanview_plugins_setup.exe"
Invoke-WebRequest -Uri $pluginsUrl -OutFile $pluginsInstaller
Start-Process -FilePath $pluginsInstaller -Wait
Remove-Item -Path $pluginsInstaller

# Pobieranie i instalacja IrfanView lang polish
Write-Host "Instalacja IrfanView 3/3."
$langInstaller = "$env:TEMP\irfanview_lang_setup.exe"
Invoke-WebRequest -Uri $langUrl -OutFile $langInstaller
Start-Process -FilePath $langInstaller -Wait
Remove-Item -Path $langInstaller

# Uruchomienie IrfanView
cls
Write-Host "Instalacja IrfanView ukończona."
Start-Process -FilePath $app
