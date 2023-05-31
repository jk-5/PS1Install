$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

cls
try {
        wevtutil.exe cl "Microsoft-Windows-Windows Defender/Operational" -ErrorAction Stop
        Remove-Item -Path "C:\ProgramData\Microsoft\Windows Defender\Scans\History\Service" -Recurse -Force -ErrorAction Stop
        Write-Host "Usunięto historię skanowania Windows Defender."
    }
    catch {
        Write-Host "Wystąpił błąd podczas usuwania historii skanowania Windows Defender:"
    }

