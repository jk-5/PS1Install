$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

# Definicja zmiennych
$irfanviewUrl = "https://download.instalki.org/programy/Windows/Grafika/przegladarki_grafiki/iview462_x64_setup.exe"
$pluginsUrl = "http://www.storage.programosy.pl/iview462_plugins_x64_setup.exe"
$langUrl = "https://www.irfanview.net/lang/irfanview_lang_polski.exe"
$installDir = "C:\Program Files\IrfanView"

# Pobieranie i instalacja IrfanView
$irfanviewInstaller = "$env:TEMP\irfanview_setup.exe"
Invoke-WebRequest -Uri $irfanviewUrl -OutFile $irfanviewInstaller
Start-Process -FilePath $irfanviewInstaller -Wait
Remove-Item -Path $irfanviewInstaller

# Pobieranie i instalacja IrfanView Plugins
$pluginsInstaller = "$env:TEMP\irfanview_plugins_setup.exe"
Invoke-WebRequest -Uri $pluginsUrl -OutFile $pluginsInstaller
Start-Process -FilePath $pluginsInstaller -Wait
Remove-Item -Path $pluginsInstaller

# Pobieranie i instalacja IrfanView lang polish
$langInstaller = "$env:TEMP\irfanview_lang_setup.exe"
Invoke-WebRequest -Uri $langUrl -OutFile $langInstaller
Start-Process -FilePath $langInstaller -Wait
Remove-Item -Path $langInstaller
