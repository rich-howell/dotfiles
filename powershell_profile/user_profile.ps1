clear-host
Write-Host

#Prompt 

Import-Module posh-git
Import-Module oh-my-posh

oh-my-posh --init --shell pwsh -config .\config\powershell\takuya.omp.json | Invoke-Expression

#Icons 

Import-Module -Name terminal-icons

#Alias

Set-Alias ll ls
Set-Alias clr clear

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function richinsql () {
  set-location -path D:\workspace\richinsql-blog
}

function richinsql-serve () {
  hugo server -w -F -D
}