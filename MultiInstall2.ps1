$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

# Ustawienie kodowania na UTF-8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

cls

# Długość czasu animacji w sekundach
$duration = 3
# Czas trwania każdego kroku animacji w milisekundach
$step = 100

# Obliczenie ilości kroków na podstawie podanego czasu trwania
$steps = $duration * 1000 / $step

# Zestaw znaków używanych w animacji
$animation = @('|', '/', '-', '\')

for ($i = 0; $i -lt $steps; $i++) {
    $frame = $i % $animation.Length
    Write-Host -NoNewline -ForegroundColor Green "`r$($animation[$frame]) Ładowanie..."
    Start-Sleep -Milliseconds $step
}

$Host.UI.RawUI.ForegroundColor = 'Green'

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
    Write-Host "║g. Windows & Office (Permanent)   ║"
    Write-Host "║h. Windows & Office (Renewal)     ║"
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
   			Write-Host "------------------------------------"
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
            irm https://massgrave.dev/get | iex
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
