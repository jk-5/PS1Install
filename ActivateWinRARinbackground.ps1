$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

cls

$file = "C:\Program Files\WinRAR\rarreg.key"
$app = "C:\Program Files\WinRAR\WinRAR.exe"

if (Test-Path -Path $file -PathType Leaf) {
Remove-Item $file
}

New-Item $file
Add-content "C:\Program Files\WinRAR\rarreg.key" 'RAR registration data'
Add-content "C:\Program Files\WinRAR\rarreg.key" 'WinRAR'
Add-content "C:\Program Files\WinRAR\rarreg.key" 'Unlimited Company License'
Add-content "C:\Program Files\WinRAR\rarreg.key" 'UID=4b914fb772c8376bf571'
Add-content "C:\Program Files\WinRAR\rarreg.key" '6412212250f5711ad072cf351cfa39e2851192daf8a362681bbb1d'
Add-content "C:\Program Files\WinRAR\rarreg.key" 'cd48da1d14d995f0bbf960fce6cb5ffde62890079861be57638717'
Add-content "C:\Program Files\WinRAR\rarreg.key" '7131ced835ed65cc743d9777f2ea71a8e32c7e593cf66794343565'
Add-content "C:\Program Files\WinRAR\rarreg.key" 'b41bcf56929486b8bcdac33d50ecf773996052598f1f556defffbd'
Add-content "C:\Program Files\WinRAR\rarreg.key" '982fbe71e93df6b6346c37a3890f3c7edc65d7f5455470d13d1190'
Add-content "C:\Program Files\WinRAR\rarreg.key" '6e6fb824bcf25f155547b5fc41901ad58c0992f570be1cf5608ba9'
Add-content "C:\Program Files\WinRAR\rarreg.key" 'aef69d48c864bcd72d15163897773d314187f6a9af350808719796'

cls

Write-Host "WinRAR został pomyślnie aktywowany."
