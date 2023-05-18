$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

cls

function Show-Menu {
    param (
        [Parameter(Position = 0, Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Title,

        [Parameter(Position = 1, Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string[]]$Options
    )

    Clear-Host

    Write-Host "====== $Title ======`n"

    for ($i = 0; $i -lt $Options.Length; $i++) {
        Write-Host "$($i + 1). $($Options[$i])"
    }

    Write-Host "`n0. Zamknij`n"
    Write-Host "====== $Title ======`n"
    do {
        $choice = Read-Host "`nWybierz"
    } while (![int]::TryParse($choice, [ref]$null) -or $choice -lt 0 -or $choice -gt $Options.Length)

    return $choice
}

# Przykładowe opcje menu
$options = @(
    "Instaluj Chrome",
    "Instaluj WinRAR",
    "Instaluj IrfanView",
    "Instaluj K-Lite Codec Pack Mega",
    "Instaluj Adobe Acrobat Reader DC",
    "Instaluj wszystkie programy (1-5)",
    "Instaluj SpotX (modyfikowany Spotify)",
    "Aktywacja Windows",
    "Aktywacja Office 2019/2021"
)

do {
    $choice = Show-Menu -Title "Multi Installer by J.K" -Options $options

    switch ($choice) {
        1 {
            Write-Host "Instalacja Chrome"
            irm https://raw.githubusercontent.com/jk-5/PS1Install/main/Install4.ps1 | iex
        }
        2 {
            Write-Host "Instalacja WinRar"
            irm https://raw.githubusercontent.com/jk-5/PS1Install/main/Install2.ps1 | iex
        }
        3 {
            Write-Host "Instalacja IrfanView"
            irm https://raw.githubusercontent.com/jk-5/PS1Install/main/Install3.ps1 | iex
        }
		4 {
            Write-Host "Instalacja K-Lite Codec Pack Mega"
            irm https://raw.githubusercontent.com/jk-5/PS1Install/main/Install6.ps1 | iex
        }
		5 {
            Write-Host "Instalacja Adobe Acrobat Reader DC"
            irm https://raw.githubusercontent.com/jk-5/PS1Install/main/Install5.ps1 | iex
        }
		6 {
            Write-Host "Instalacja wszystkich programów (1-5)"
            irm https://raw.githubusercontent.com/jk-5/PS1Install/main/FullInstall.ps1 | iex
        }
		7 {
            Write-Host "Instaluj SpotX (modyfikowany Spotify)"
	    $spotxUrl = "https://raw.githubusercontent.com/amd64fox/SpotX/main/scripts/Install_Auto.bat"
            $spotxInstaller = "$env:TEMP\spotx.cmd"
	    Invoke-WebRequest -Uri $spotxUrl -OutFile $spotxInstaller
	    Start-Process -FilePath $spotxInstaller -Wait
	    Remove-Item -Path $spotxInstaller
        }
		8 {
            Write-Host "Aktywacja Windows"
            irm https://massgrave.dev/get | iex
        }
		9 {
            Write-Host "Aktywacja Office 2019/2021"
	    $aioUrl = "https://raw.githubusercontent.com/abbodi1406/KMS_VL_ALL_AIO/master/KMS_VL_ALL_AIO.cmd"
            $aioInstaller = "$env:TEMP\ALL_AIO.cmd"
	    Invoke-WebRequest -Uri $aioUrl -OutFile $aioInstaller
	    Start-Process -FilePath $aioInstaller -Wait
	    Remove-Item -Path $aioInstaller
        }
        0 {
            Write-Host "Zamykanie programu..."
        }
    }

    if ($choice -ne 0) {
        # Dodaj opóźnienie, aby użytkownik mógł zobaczyć wynik i powrót do menu
        Start-Sleep -Seconds 2
    }

} while ($choice -ne 0)
