$ErrorActionPreference = "Stop"
# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

irm https://raw.githubusercontent.com/jk-5/PS1Install/main/Install4.ps1 | iex
irm https://raw.githubusercontent.com/jk-5/PS1Install/main/Install2.ps1 | iex
