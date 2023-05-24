$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

cls

# Instalacja Chrome
irm https://raw.githubusercontent.com/jk-5/PS1Install/main/InstallChrome.ps1 | iex

# Instalacja WinRar
irm https://raw.githubusercontent.com/jk-5/PS1Install/main/InstallWinRAR.ps1 | iex

# Instalacja IrfanView
irm https://raw.githubusercontent.com/jk-5/PS1Install/main/InstallIrfanView.ps1 | iex

# Instalacja K-Lite Codec Pack Mega
irm https://raw.githubusercontent.com/jk-5/PS1Install/main/InstallCodecPack.ps1 | iex

# Instalacja Adobe Acrobat Reader DC
irm https://raw.githubusercontent.com/jk-5/PS1Install/main/InstallAcrobatReader.ps1 | iex

