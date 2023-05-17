$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

# Instalacja Chrome
irm https://raw.githubusercontent.com/jk-5/PS1Install/main/Install4.ps1 | iex

# Instalacja WinRar
irm https://raw.githubusercontent.com/jk-5/PS1Install/main/Install2.ps1 | iex

# Instalacja IrfanView
irm https://raw.githubusercontent.com/jk-5/PS1Install/main/Install3.ps1 | iex

# Instalacja K-Lite Codec Pack Mega
irm https://raw.githubusercontent.com/jk-5/PS1Install/main/Install6.ps1 | iex

# Instalacja Adobe Acrobat Reader DC
irm https://raw.githubusercontent.com/jk-5/PS1Install/main/Install5.ps1 | iex

