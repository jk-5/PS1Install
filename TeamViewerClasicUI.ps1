$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

cls

$app = "C:\Program Files\TeamViewer\TeamViewer.exe"

Set-ItemProperty -Path "HKCU:\SOFTWARE\TeamViewer" -Name "UIVersion" -Value 2

Start-Process -FilePath $app

cls
