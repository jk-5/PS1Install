$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

# Ustawienie kodowania na UTF-8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

cls

# Wyświetlenie menu
function Show-Menu {
    Write-Host "╔══════════════════════════════════╗"
    Write-Host "║      Multi Installer by J.K      ║"
    Write-Host "╠══════════════════════════════════╣"
	Write-Host "╠═══════════ Podstawowe ═══════════╣"
    Write-Host "║1. Google Chrome                  ║"
    Write-Host "║2. WinRAR                         ║"
    Write-Host "║3. InfanView                      ║"
    Write-Host "║4. K-Lite Codec Pack Mega         ║"
    Write-Host "║5. Adobe Acrobat Reader DC        ║"
    Write-Host "║6. TeamViewer                     ║"
    Write-Host "║7. SpotX (modyfikowany Spotify)   ║"
    Write-Host "║8. Office 2021 Professional Plus  ║"
    Write-Host "║9. Wszystkie podstawowe (1-5)     ║"
    Write-Host "╠══════════ Zaawansowane ══════════║"
    Write-Host "║a. Winaero Tweaker                ║"
    Write-Host "║b. CCleaner                       ║"
    Write-Host "║c. Notepad++                      ║"
    Write-Host "║d. Menu kontekstowe pulpitu       ║"
    Write-Host "║e. Usuń historię Windows Defender ║"
    Write-Host "║f. Włącz ClassicUI w TeamViewer   ║"
	Write-Host "╠═══════════ Aktywatory ═══════════║"
	Write-Host "║g. Windows 10/11                  ║"
    Write-Host "║h. Office 2021/2023               ║"
    Write-Host "║i. WinRAR                         ║"
	Write-Host "╠════ Test ustawień domyślnych ════║"
    Write-Host "║j. Przeglądarka                   ║"
    Write-Host "║k. Muzyka                         ║"
    Write-Host "║l. Zdjęcia                        ║"
    Write-Host "║m. Filmy                          ║"
	Write-Host "╠══════════════════════════════════╣"
	Write-Host "║0. Zamknij                        ║"
    Write-Host "╚══════════════════════════════════╝"
}

# Funkcja wyboru akcji
function Execute-Choice {
    param (
        [string]$choice
    )

    switch ($choice) {
        '1' {
            Write-Host "Instalacja Google Chrome"
            irm https://raw.githubusercontent.com/jk-5/PS1Install/main/InstallChrome.ps1 | iex
        }
        '2' {
            Write-Host "Instalacja WinRar"
            irm https://raw.githubusercontent.com/jk-5/PS1Install/main/InstallWinRAR.ps1 | iex
        }
        '3' {
            Write-Host "Instalacja IrfanView"
            irm https://raw.githubusercontent.com/jk-5/PS1Install/main/InstallIrfanView.ps1 | iex
        }
        '4' {
            Write-Host "Instalacja K-Lite Codec Pack Mega"
            irm https://raw.githubusercontent.com/jk-5/PS1Install/main/InstallCodecPack.ps1 | iex
        }
        '5' {
            Write-Host "Instalacja Adobe Acrobat Reader DC"
            irm https://raw.githubusercontent.com/jk-5/PS1Install/main/InstallAcrobatReader.ps1 | iex
        }
        '6' {
            Write-Host "Instalacja TeamViewer."
            irm https://raw.githubusercontent.com/jk-5/PS1Install/main/InstallTeamViewer.ps1 | iex
        }
        '7' {
            Write-Host "Instaluj SpotX (modyfikowany Spotify)"
	    irm https://raw.githubusercontent.com/jk-5/PS1Install/main/InstallSpotX.ps1 | iex
        }
        '8' { 
			Write-Host "------------------------------------"
            Write-Host "Instalacja Office 2021 Professional Plus" 
			Write-Host "Do pobrania około 4GB danych."
            $continue = Read-Host "Czy chcesz kontynuować? (t/n)"
            if ($continue -ne 't') {
                return  # Powrót do głównego menu
            }
			irm https://raw.githubusercontent.com/jk-5/PS1Install/main/InstallOffice2021.ps1 | iex
        }
        '9' { 
			Write-Host "------------------------------------"
            Write-Host "Automatyczna instalacja programów:"
			Write-Host "Google Chrome"
			Write-Host "WinRAR"
			Write-Host "InfanView"
			Write-Host "K-Lite Codec Pack Mega"
			Write-Host "Adobe Acrobat Reader DC"
            $confirm = Read-Host "Czy chcesz kontynuować? (t/n)"
            if ($confirm -ne 't') {
                return  # Powrót do głównego menu
            }
			irm https://raw.githubusercontent.com/jk-5/PS1Install/main/FullInstall.ps1 | iex 
        }
        '0' { cls
			exit
			}
        'a' { Write-Host "Wybrałeś opcję a" }
        'b' { Write-Host "Wybrałeś opcję b" }
        'c' { Write-Host "Wybrałeś opcję c" }
        'd' { Write-Host "Wybrałeś opcję d" }
        'e' { Write-Host "Wybrałeś opcję e" }
        'f' { Write-Host "Wybrałeś opcję f" }
		'g' { Write-Host "Wybrałeś opcję g" }
        'h' { Write-Host "Wybrałeś opcję h" }
        'i' { Write-Host "Wybrałeś opcję i" }
        'j' { Write-Host "Wybrałeś opcję j" }
        'k' { Write-Host "Wybrałeś opcję k" }
        'l' { Write-Host "Wybrałeś opcję l" }
		'm' { Write-Host "Wybrałeś opcję m" }
        default { Write-Host "Nieprawidłowy wybór, spróbuj ponownie." }
    }
    
    # Opóźnienie przed powrotem do menu
    Start-Sleep -Seconds 3
}

# Główna część skryptu
while ($true) {
    Show-Menu
    $userInput = Read-Host "Wybierz opcję"
    Execute-Choice -choice $userInput
}