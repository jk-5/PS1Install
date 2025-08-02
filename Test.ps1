$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

# Ustawienie kodowania na UTF-8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

cls

# Ustawienia
$text = "Created by J.K"
$delay = 50  # ms między literami

# Faza 1: Wpisywanie po jednym znaku
for ($i = 1; $i -le $text.Length; $i++) {
    Write-Host "`r$text".Substring(0, $i) -NoNewline
    Start-Sleep -Milliseconds $delay
}

# 👇 Dodaj ponowne wypisanie pełnego napisu, by był widoczny po pętli
Write-Host "`r$text" -NoNewline

# Pauza po pełnym napisie
Start-Sleep -Seconds 1

# Faza 2: Usuwanie od początku
for ($i = 1; $i -le $text.Length; $i++) {
    $remaining = $text.Substring($i)
    Write-Host "`r$remaining" + " " * $i -NoNewline
    Start-Sleep -Milliseconds $delay
}

# Przejdź do nowej linii po zakończeniu
Write-Host ""


$Host.UI.RawUI.ForegroundColor = 'Green'

cls

# Wyświetlenie menu
function Show-Menu {
    Write-Host "╔══════════════════════════════════╗"
    Write-Host "║   Multi Installer by J.K v2.71   ║"
    Write-Host "╠══════════════════════════════════╣"
	Write-Host "╠═══════════ Podstawowe ═══════════╣"
    Write-Host "║1. Google Chrome                  ║"
    Write-Host "║2. WinRAR                         ║"
    Write-Host "║3. InfanView                      ║"
    Write-Host "║4. K-Lite Codec Pack Mega         ║"
    Write-Host "║5. Adobe Acrobat Reader DC        ║"
    Write-Host "║6. TeamViewer                     ║"
    Write-Host "║7. SpotX (modyfikowany Spotify)   ║"
    Write-Host "║8. Office                         ║"
    Write-Host "║9. Wszystkie podstawowe (1-5)     ║"
    Write-Host "╠══════════ Zaawansowane ══════════║"
    Write-Host "║a. Winaero Tweaker                ║"
    Write-Host "║b. CCleaner                       ║"
    Write-Host "║c. Notepad++                      ║"
    Write-Host "║d. Menu kontekstowe pulpitu       ║"
    Write-Host "║e. Usuń historię Windows Defender ║"
    Write-Host "║f. Włącz ClassicUI w TeamViewer   ║"
    Write-Host "╠═══════════ Aktywatory ═══════════║"
    Write-Host "║g. Windows & Office (Permanent)   ║"
    Write-Host "║h. Windows & Office (Renewal)     ║"
    Write-Host "║i. WinRAR                         ║"
    Write-Host "╠════ Test ustawień domyślnych ════║"
    Write-Host "║j. Przeglądarka                   ║"
    Write-Host "║k. Muzyka                         ║"
    Write-Host "║l. Zdjęcia                        ║"
	Write-Host "║m. Filmy                          ║"
	Write-Host "╠═══════Winget check updates═══════╣"
    Write-Host "║n. Wyszukaj aktualizacje          ║"
    Write-Host "║o. Zainstaluj aktualizacje        ║"
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
            Write-Host "Instalacja Office" 
	    irm https://raw.githubusercontent.com/jk-5/PS1Install/main/Office_Installer.ps1 | iex
        }
        '9' { 
			Write-Host "------------------------------------"
            Write-Host "Automatyczna instalacja programów:"
			Write-Host "Google Chrome"
			Write-Host "WinRAR"
			Write-Host "InfanView"
			Write-Host "K-Lite Codec Pack Mega"
			Write-Host "Adobe Acrobat Reader DC"
   			Write-Host "------------------------------------"
            $confirm = Read-Host "Czy chcesz kontynuować? (t/n)"
            if ($confirm -ne 't') {
                return  # Powrót do głównego menu
            }
			irm https://raw.githubusercontent.com/jk-5/PS1Install/main/FullInstall.ps1 | iex 
        }
        '0' { cls
			exit
			}
        'a' {
            Write-Host "Pobieranie Winaero Tweaker"
            irm https://raw.githubusercontent.com/jk-5/PS1Install/main/Download_Winaero.ps1 | iex
        }
        'b' {
            Write-Host "Pobieranie CCleaner"
            irm https://raw.githubusercontent.com/jk-5/PS1Install/main/Download_CCleaner.ps1 | iex
        }
        'c' {
            Write-Host "Pobieranie Notepad++"
            irm https://raw.githubusercontent.com/jk-5/PS1Install/main/Download_Notepad.ps1 | iex
        }
        'd' {
            Write-Host "Pobieranie pliku"
            irm https://raw.githubusercontent.com/jk-5/PS1Install/main/Add_desktop_shell.ps1 | iex
        }
        'e' {
            Write-Host "Pobieranie pliku"
            irm https://raw.githubusercontent.com/jk-5/PS1Install/main/Clear_Windows_Defender_History.ps1 | iex
        }
        'f' {
            Write-Host "Zmiana wyglądu TeamViewer"
            irm https://raw.githubusercontent.com/jk-5/PS1Install/main/TeamViewerClassicUI.ps1 | iex
        }
		'g' {
            Write-Host "Aktywacja Windows & Office (Permanent)"
            irm https://get.activated.win | iex
        }
        'h' {
            Write-Host "Aktywacja Windows & Office (Renewal)"
            irm https://raw.githubusercontent.com/jk-5/PS1Install/main/ActivateKMS.ps1 | iex
        }
        'i' {
            Write-Host "Aktywacja WinRAR"
            irm https://raw.githubusercontent.com/jk-5/PS1Install/main/ActivateWinRAR.ps1 | iex
        }
        'j' {
            Write-Host "Test przeglądarki"
            irm https://raw.githubusercontent.com/jk-5/PS1Install/main/Download_Web.ps1| iex
        }
        'k' {
            Write-Host "Test odtwarzacza muzyki"
            irm https://raw.githubusercontent.com/jk-5/PS1Install/main/Download_Music.ps1 | iex
        }
        'l' {
            Write-Host "Test przeglądarki zdjęć"
            irm https://raw.githubusercontent.com/jk-5/PS1Install/main/Download_Image.ps1| iex
        }
		'm' {
            Write-Host "Test odtwarzacza filmów"
            irm https://raw.githubusercontent.com/jk-5/PS1Install/main/Download_Video.ps1 | iex
        }
		'n' {
            Write-Host "Wyszukiwanie aktualizacji"
	    cls
            winget upgrade
			Start-Sleep -Seconds 5
			$Host.UI.RawUI.ForegroundColor = 'Green'
        }
	'o' {
            Write-Host "Instalowanie aktualizacji"
	    $confirm = Read-Host "Czy chcesz kontynuować? (t/n)"
            if ($confirm -ne 't') {
	    	cls
                return  # Powrót do głównego menu
            }
	    cls
            winget upgrade --all
			Start-Sleep -Seconds 5
			$Host.UI.RawUI.ForegroundColor = 'Green'
        }
        default { Write-Host "Nieprawidłowy wybór, spróbuj ponownie." }
    }
    
    # Opóźnienie przed powrotem do menu
    Start-Sleep -Seconds 2
}

# Główna część skryptu
while ($true) {
    Show-Menu
    $userInput = Read-Host "Wybierz opcję"
    Execute-Choice -choice $userInput
}

