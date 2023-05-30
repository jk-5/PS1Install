$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

cls

$aioUrl = "https://raw.githubusercontent.com/abbodi1406/KMS_VL_ALL_AIO/master/KMS_VL_ALL_AIO.cmd"
           $aioInstaller = "$env:TEMP\ALL_AIO.cmd"
		   Invoke-WebRequest -Uri $aioUrl -OutFile $aioInstaller
	       Start-Process -FilePath $aioInstaller -Wait
	       Remove-Item -Path $aioInstaller
