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

    Write-Host "=== $Title ===`n"

    for ($i = 0; $i -lt $Options.Length; $i++) {
        Write-Host "$($i + 1). $($Options[$i])"
    }

    Write-Host "`n0. Exit"

    do {
        $choice = Read-Host "`nWybór:"
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
    "Instaluj wszystko",
    "Zamknij"
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
            Write-Host "Instalacja wszystkiego"
            irm https://raw.githubusercontent.com/jk-5/PS1Install/main/FullInstall.ps1 | iex
        }
        0 {
            Write-Host "Wyjście z programu..."
        }
    }

    if ($choice -ne 0) {
        # Dodaj opóźnienie, aby użytkownik mógł zobaczyć wynik i powrót do menu
        Start-Sleep -Seconds 3
    }

} while ($choice -ne 0)
