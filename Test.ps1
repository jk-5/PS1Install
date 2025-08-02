$ErrorActionPreference = "Stop"
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

cls
$Host.UI.RawUI.ForegroundColor = 'Green'
$text = "Created by J.K"
$delay = 100
for ($i = 1; $i -le $text.Length; $i++) {
    Write-Host "`r$text".Substring(0, $i) -NoNewline
    Start-Sleep -Milliseconds $delay
}
Write-Host "`r$text" -NoNewline
Start-Sleep -Seconds 1
cls

function Show-MainMenu {
    Write-Host "╔══════════════════════════════════╗"
    Write-Host "║   Multi Installer by J.K v2.71   ║"
    Write-Host "╠══════════════════════════════════╣"
    Write-Host "║1. Podstawowe                     ║"
    Write-Host "║2. Zaawansowane                   ║"
    Write-Host "║3. Aktywatory                     ║"
    Write-Host "║4. Test ustawień domyślnych       ║"
    Write-Host "║5. Winget - aktualizacje          ║"
    Write-Host "║0. Zamknij                        ║"
    Write-Host "╚══════════════════════════════════╝"
}

function Show-PodstawoweMenu {
    Write-Host "╔═══════════ Podstawowe ═══════════╗"
    Write-Host "║1. Google Chrome                  ║"
    Write-Host "║2. WinRAR                         ║"
    Write-Host "║3. InfanView                      ║"
    Write-Host "║4. K-Lite Codec Pack Mega         ║"
    Write-Host "║5. Adobe Acrobat Reader DC        ║"
    Write-Host "║6. TeamViewer                     ║"
    Write-Host "║7. SpotX (Spotify mod)            ║"
    Write-Host "║8. Office                         ║"
    Write-Host "║9. Wszystkie podstawowe (1-5)     ║"
    Write-Host "║0. Powrót                         ║"
    Write-Host "╚══════════════════════════════════╝"
}

function Execute-Podstawowe {
    while ($true) {
        Show-PodstawoweMenu
        $choice = Read-Host "Wybierz opcję"
        switch ($choice) {
            '1' { winget install Google.Chrome }
            '2' { winget install RARLab.WinRAR }
            '3' { winget install IrfanSkiljan.IrfanView
	    	  winget install IrfanSkiljan.IrfanView.PlugIns
		  irm https://raw.githubusercontent.com/jk-5/PS1Install/main/InstallIrfanView.ps1 | iex}
            '4' { irm https://raw.githubusercontent.com/jk-5/PS1Install/main/InstallCodecPack.ps1 | iex }
            '5' { irm https://raw.githubusercontent.com/jk-5/PS1Install/main/InstallAcrobatReader.ps1 | iex }
            '6' { irm https://raw.githubusercontent.com/jk-5/PS1Install/main/InstallTeamViewer.ps1 | iex }
            '7' { irm https://raw.githubusercontent.com/jk-5/PS1Install/main/InstallSpotX.ps1 | iex }
            '8' { irm https://raw.githubusercontent.com/jk-5/PS1Install/main/Office_Installer.ps1 | iex }
            '9' {
                Write-Host "Instalacja wszystkich podstawowych programów"
                $confirm = Read-Host "Czy chcesz kontynuować? (t/n)"
                if ($confirm -eq 't') {
                    irm https://raw.githubusercontent.com/jk-5/PS1Install/main/FullInstall.ps1 | iex
                }
            }
            '0' { break }
            default { Write-Host "Nieprawidłowy wybór." }
        }
        Start-Sleep -Seconds 2
        cls
    }
}

function Show-ZaawansowaneMenu {
    Write-Host "╔══════════ Zaawansowane ══════════╗"
    Write-Host "║1. Winaero Tweaker                ║"
    Write-Host "║2. CCleaner                       ║"
    Write-Host "║3. Notepad++                      ║"
    Write-Host "║4. Menu kontekstowe pulpitu       ║"
    Write-Host "║5. Usuń historię Defendera        ║"
    Write-Host "║6. TeamViewer - ClassicUI         ║"
    Write-Host "║0. Powrót                         ║"
    Write-Host "╚══════════════════════════════════╝"
}

function Execute-Zaawansowane {
    while ($true) {
        Show-ZaawansowaneMenu
        $choice = Read-Host "Wybierz opcję"
        switch ($choice) {
            '1' { irm https://raw.githubusercontent.com/jk-5/PS1Install/main/Download_Winaero.ps1 | iex }
            '2' { irm https://raw.githubusercontent.com/jk-5/PS1Install/main/Download_CCleaner.ps1 | iex }
            '3' { irm https://raw.githubusercontent.com/jk-5/PS1Install/main/Download_Notepad.ps1 | iex }
            '4' { irm https://raw.githubusercontent.com/jk-5/PS1Install/main/Add_desktop_shell.ps1 | iex }
            '5' { irm https://raw.githubusercontent.com/jk-5/PS1Install/main/Clear_Windows_Defender_History.ps1 | iex }
            '6' { irm https://raw.githubusercontent.com/jk-5/PS1Install/main/TeamViewerClassicUI.ps1 | iex }
            '0' { break }
            default { Write-Host "Nieprawidłowy wybór." }
        }
        Start-Sleep -Seconds 2
        cls
    }
}

function Show-AktywatoryMenu {
    Write-Host "╔═══════════ Aktywatory ═══════════╗"
    Write-Host "║1. Windows & Office (Permanent)   ║"
    Write-Host "║2. Windows & Office (Renewal)     ║"
    Write-Host "║3. WinRAR                         ║"
    Write-Host "║0. Powrót                         ║"
    Write-Host "╚══════════════════════════════════╝"
}

function Execute-Aktywatory {
    while ($true) {
        Show-AktywatoryMenu
        $choice = Read-Host "Wybierz opcję"
        switch ($choice) {
            '1' { irm https://get.activated.win | iex }
            '2' { irm https://raw.githubusercontent.com/jk-5/PS1Install/main/ActivateKMS.ps1 | iex }
            '3' { irm https://raw.githubusercontent.com/jk-5/PS1Install/main/ActivateWinRAR.ps1 | iex }
            '0' { break }
            default { Write-Host "Nieprawidłowy wybór." }
        }
        Start-Sleep -Seconds 2
        cls
    }
}

function Show-TestMenu {
    Write-Host "╔════ Test ustawień domyślnych ════╗"
    Write-Host "║1. Przeglądarka                   ║"
    Write-Host "║2. Muzyka                         ║"
    Write-Host "║3. Zdjęcia                        ║"
    Write-Host "║4. Filmy                          ║"
    Write-Host "║0. Powrót                         ║"
    Write-Host "╚══════════════════════════════════╝"
}

function Execute-Test {
    while ($true) {
        Show-TestMenu
        $choice = Read-Host "Wybierz opcję"
        switch ($choice) {
            '1' { irm https://raw.githubusercontent.com/jk-5/PS1Install/main/Download_Web.ps1 | iex }
            '2' { irm https://raw.githubusercontent.com/jk-5/PS1Install/main/Download_Music.ps1 | iex }
            '3' { irm https://raw.githubusercontent.com/jk-5/PS1Install/main/Download_Image.ps1 | iex }
            '4' { irm https://raw.githubusercontent.com/jk-5/PS1Install/main/Download_Video.ps1 | iex }
            '0' { break }
            default { Write-Host "Nieprawidłowy wybór." }
        }
        Start-Sleep -Seconds 2
        cls
    }
}

function Show-WingetMenu {
    Write-Host "╔═══════ Winget - aktualizacje ═══════╗"
    Write-Host "║1. Wyszukaj aktualizacje             ║"
    Write-Host "║2. Zainstaluj aktualizacje           ║"
    Write-Host "║0. Powrót                            ║"
    Write-Host "╚═════════════════════════════════════╝"
}

function Execute-Winget {
    while ($true) {
        Show-WingetMenu
        $choice = Read-Host "Wybierz opcję"
        switch ($choice) {
            '1' {
                cls
                winget upgrade
                Start-Sleep -Seconds 5
            }
            '2' {
                $confirm = Read-Host "Czy chcesz kontynuować? (t/n)"
                if ($confirm -eq 't') {
                    cls
                    winget upgrade --all
                    Start-Sleep -Seconds 5
                }
            }
            '0' { break }
            default { Write-Host "Nieprawidłowy wybór." }
        }
        Start-Sleep -Seconds 2
        cls
    }
}

while ($true) {
    Show-MainMenu
    $mainChoice = Read-Host "Wybierz opcję"
    switch ($mainChoice) {
        '1' { Execute-Podstawowe }
        '2' { Execute-Zaawansowane }
        '3' { Execute-Aktywatory }
        '4' { Execute-Test }
        '5' { Execute-Winget }
        '0' { break }
        default { Write-Host "Opcja niedostępna." }
    }
    Start-Sleep -Seconds 1
    cls
}
