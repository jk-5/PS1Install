Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Pobierz ikonę z GitHuba
$iconUrl = "https://raw.githubusercontent.com/jk-5/PS1Install/main/Icon.ico"
$iconPath = "$env:TEMP\icon.ico"
Invoke-WebRequest -Uri $iconUrl -OutFile $iconPath -UseBasicParsing
$AppIcon = New-Object System.Drawing.Icon($iconPath)

function New-Form {
    param(
        [string]$Title,
        [System.Drawing.Size]$Size,
        [scriptblock]$ContentScript
    )
    $form = New-Object System.Windows.Forms.Form
    $form.Text = $Title
    $form.Size = $Size
    $form.StartPosition = 'CenterScreen'
    $form.Icon = $AppIcon
    . $ContentScript.Invoke($form)
    return $form
}

function Show-MainForm {
    $form = New-Form -Title "Multi Installer by J.K" -Size (New-Object Drawing.Size(400, 350)) -ContentScript {
        param($form)
        
        $buttons = @(
            "Podstawowe", "Zaawansowane", "Aktywatory",
            "Test ustawień domyślnych", "Winget - aktualizacje", "Zamknij"
        )
        
        for ($i = 0; $i -lt $buttons.Count; $i++) {
            $btn = New-Object Windows.Forms.Button
            $btn.Text = $buttons[$i]
            $btn.Size = New-Object Drawing.Size(340, 40)
            $btn.Location = New-Object Drawing.Point(30, 20 + ($i * 45))
            $btn.Add_Click({
                switch ($btn.Text) {
                    "Podstawowe" { Show-PodstawoweForm.ShowDialog() }
                    "Zaawansowane" { Show-ZaawansowaneForm.ShowDialog() }
                    "Aktywatory" { Show-AktywatoryForm.ShowDialog() }
                    "Test ustawień domyślnych" { Show-TestForm.ShowDialog() }
                    "Winget - aktualizacje" { Show-WingetForm.ShowDialog() }
                    "Zamknij" { $form.Close() }
                }
            })
            $form.Controls.Add($btn)
        }
    }
    $form.ShowDialog()
}

function Show-OptionForm {
    param(
        [string]$Title,
        [array]$Options,
        [hashtable]$Actions
    )
    $form = New-Form -Title $Title -Size (New-Object Drawing.Size(420, ($Options.Count * 45 + 60))) -ContentScript {
        param($form)
        for ($i = 0; $i -lt $Options.Count; $i++) {
            $btn = New-Object Windows.Forms.Button
            $btn.Text = $Options[$i]
            $btn.Size = New-Object Drawing.Size(370, 40)
            $btn.Location = New-Object Drawing.Point(20, 15 + ($i * 45))
            $btn.Add_Click({
                $action = $Actions[$btn.Text]
                if ($action -ne $null) { & $action }
                $form.Close()
            })
            $form.Controls.Add($btn)
        }
    }
    return $form
}

function Show-PodstawoweForm {
    $options = @("Google Chrome", "WinRAR", "InfanView", "K-Lite Codec Pack Mega", "Adobe Acrobat Reader DC", "TeamViewer", "SpotX (Spotify mod)", "Office", "Wszystkie podstawowe", "Powrót")
    $actions = @{
        "Google Chrome" = { winget install Google.Chrome.EXE }
        "WinRAR" = { winget install RARLab.WinRAR; irm https://raw.githubusercontent.com/jk-5/PS1Install/main/ActivateWinRAR.ps1 | iex }
        "InfanView" = { winget install IrfanSkiljan.IrfanView; winget install IrfanSkiljan.IrfanView.PlugIns; irm https://raw.githubusercontent.com/jk-5/PS1Install/main/InstallIrfanView.ps1 | iex }
        "K-Lite Codec Pack Mega" = { winget install CodecGuide.K-LiteCodecPack.Mega }
        "Adobe Acrobat Reader DC" = { winget install Adobe.Acrobat.Reader.64-bit }
        "TeamViewer" = { winget install TeamViewer.TeamViewer; Set-ItemProperty -Path "HKCU:\SOFTWARE\TeamViewer" -Name "UIVersion" -Value 2 }
        "SpotX (Spotify mod)" = { irm https://raw.githubusercontent.com/jk-5/PS1Install/main/InstallSpotX.ps1 | iex }
        "Office" = { irm https://raw.githubusercontent.com/jk-5/PS1Install/main/Office_Installer.ps1 | iex }
        "Wszystkie podstawowe" = {
            $c = [System.Windows.Forms.MessageBox]::Show("Zainstalować wszystkie podstawowe aplikacje?", "Potwierdzenie", "YesNo")
            if ($c -eq "Yes") {
                winget install Google.Chrome.EXE
                winget install RARLab.WinRAR
                irm https://raw.githubusercontent.com/jk-5/PS1Install/main/ActivateWinRAR.ps1 | iex
                winget install IrfanSkiljan.IrfanView
                winget install IrfanSkiljan.IrfanView.PlugIns
                irm https://raw.githubusercontent.com/jk-5/PS1Install/main/InstallIrfanView.ps1 | iex
                winget install CodecGuide.K-LiteCodecPack.Mega
                winget install Adobe.Acrobat.Reader.64-bit
            }
        }
    }
    Show-OptionForm -Title "Podstawowe" -Options $options -Actions $actions
}

function Show-ZaawansowaneForm {
    $options = @("Winaero Tweaker", "CCleaner", "Notepad++", "Menu kontekstowe pulpitu", "Usuń historię Defendera", "TeamViewer - ClassicUI", "Powrót")
    $actions = @{
        "Winaero Tweaker" = { winget install winaero.tweaker }
        "CCleaner" = { winget install Piriform.CCleaner }
        "Notepad++" = { winget install Notepad++.Notepad++ }
        "Menu kontekstowe pulpitu" = { irm https://raw.githubusercontent.com/jk-5/PS1Install/main/Add_desktop_shell.ps1 | iex }
        "Usuń historię Defendera" = { irm https://raw.githubusercontent.com/jk-5/PS1Install/main/Clear_Windows_Defender_History.ps1 | iex }
        "TeamViewer - ClassicUI" = { irm https://raw.githubusercontent.com/jk-5/PS1Install/main/TeamViewerClassicUI.ps1 | iex }
    }
    Show-OptionForm -Title "Zaawansowane" -Options $options -Actions $actions
}

function Show-AktywatoryForm {
    $options = @("Windows & Office (Permanent)", "Windows & Office (Renewal)", "WinRAR", "Powrót")
    $actions = @{
        "Windows & Office (Permanent)" = { irm https://get.activated.win | iex }
        "Windows & Office (Renewal)" = { irm https://raw.githubusercontent.com/jk-5/PS1Install/main/ActivateKMS.ps1 | iex }
        "WinRAR" = { irm https://raw.githubusercontent.com/jk-5/PS1Install/main/ActivateWinRAR.ps1 | iex }
    }
    Show-OptionForm -Title "Aktywatory" -Options $options -Actions $actions
}

function Show-TestForm {
    $options = @("Przeglądarka", "Muzyka", "Zdjęcia", "Filmy", "Powrót")
    $actions = @{
        "Przeglądarka" = { irm https://raw.githubusercontent.com/jk-5/PS1Install/main/Download_Web.ps1 | iex }
        "Muzyka" = { irm https://raw.githubusercontent.com/jk-5/PS1Install/main/Download_Music.ps1 | iex }
        "Zdjęcia" = { irm https://raw.githubusercontent.com/jk-5/PS1Install/main/Download_Image.ps1 | iex }
        "Filmy" = { irm https://raw.githubusercontent.com/jk-5/PS1Install/main/Download_Video.ps1 | iex }
    }
    Show-OptionForm -Title "Test ustawień domyślnych" -Options $options -Actions $actions
}

function Show-WingetForm {
    $options = @("Wyszukaj aktualizacje", "Zainstaluj aktualizacje", "Powrót")
    $actions = @{
        "Wyszukaj aktualizacje" = { Start-Process powershell -ArgumentList "-NoProfile -Command winget upgrade" -WindowStyle Hidden }
        "Zainstaluj aktualizacje" = {
            $c = [System.Windows.Forms.MessageBox]::Show("Zainstalować wszystkie aktualizacje?", "Potwierdzenie", "YesNo")
            if ($c -eq "Yes") { Start-Process powershell -ArgumentList "-NoProfile -Command winget upgrade --all" -WindowStyle Hidden }
        }
    }
    Show-OptionForm -Title "Winget - aktualizacje" -Options $options -Actions $actions
}

# Start aplikacji
Show-MainForm
