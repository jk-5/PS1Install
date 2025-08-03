$ErrorActionPreference = "Stop"
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

cls

Add-Type -AssemblyName System.Windows.Forms

# Tworzenie formy
$form = New-Object System.Windows.Forms.Form
$form.Text = "Przykładowe GUI"
$form.Size = New-Object System.Drawing.Size(300, 200)
$form.StartPosition = "CenterScreen"

# Przycisk
$button = New-Object System.Windows.Forms.Button
$button.Text = "Kliknij mnie"
$button.Location = New-Object System.Drawing.Point(100, 70)
$button.Size = New-Object System.Drawing.Size(100, 30)
$button.Add_Click({
    [System.Windows.Forms.MessageBox]::Show("Kliknięto przycisk!")
})

# Dodanie przycisku do formy
$form.Controls.Add($button)

# Wyświetlenie formy
$form.ShowDialog()
