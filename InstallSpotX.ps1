$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

cls

$spotxUrl = "https://raw.githubusercontent.com/amd64fox/SpotX/main/scripts/Install_Auto.bat"
            $spotxInstaller = "$env:TEMP\spotx.cmd"
			Invoke-WebRequest -Uri $spotxUrl -OutFile $spotxInstaller
			Start-Process -FilePath $spotxInstaller -Wait
			Remove-Item -Path $spotxInstaller
