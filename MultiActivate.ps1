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
        $choice = Read-Host "Wybierz"
    } while (![int]::TryParse($choice, [ref]$null) -or $choice -lt 0 -or $choice -gt $Options.Length)

    return $choice
}

# Opcje menu
$options = @(
    "Aktywacja Windows",
    "Aktywacja Office 2019/2021"
)

do {
    $choice = Show-Menu -Title "Multi Activator by J.K" -Options $options

    switch ($choice) {
        1 {
            Write-Host "Aktywacja Windows"
            irm https://massgrave.dev/get | iex
        }
        2 {
            Write-Host "Aktywacja Office 2019/2021"
	    irm https://raw.githubusercontent.com/jk-5/PS1Install/main/ActivateKMS.ps1 | iex
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
