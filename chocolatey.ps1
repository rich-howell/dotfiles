Write-Host "This script is used to setup the development enviroment with the applications and tools required." -ForegroundColor Gray

Pause

Write-Host  "Attempting to install Chocolatey" -ForegroundColor Gray

try {

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

} catch {
Write-Host -ForegroundColor Red "Installing Chocolatey failed" -ForegroundColor Gray
}

$chocolatePackaging = 
@(
    "discord",
    "vscode",
    "firefox",
    "1password",
    "sql-server-management-studio",
    "github-desktop",
    "xnviewmp.install",
    "gimp",
    "microsoft-windows-terminal",
    "azure-data-studio",
    "git",
    "office-tool",
    "sqlsearch",    
    "7zip",
    "teracopy",
    "treesizefree",
    "rawtherapee",
    "signal",
    "whatsapp",
    "spotify",
    "visualstudio2022community",
    "powertoys",
    "googledrive",
    "install powershell-core",
    "stretchly"
    )

foreach ($chocolate in $chocolatePackaging) {

    Write-Host "Attempting to install " $chocolate  -ForegroundColor Gray

    try {
        choco install $chocolate -y
    }
    catch {
        Write-Host "Installing " $chocolate "failed" -ForegroundColor Red
    }
}

winget install JanDeDobbeleer.OhMyPosh -s winget

winget install "powershell" --source msstore

Write-Host "$tempLocation in use for this process" -ForegroundColor Green
$tempLocation = $env:USERPROFILE +'\Temp'

if(-Not(Test-Path -Path $tempLocation))
{
    Write-Host "Attempting to create the directory $tempLocation" -ForegroundColor Green
    New-Item -ItemType Directory -Path $tempLocation -Force -ErrorAction Stop
} else {
    Write-Host "The directory $tempLocation already exists" -ForegroundColor Green
}

$downloadLocation = $tempLocation +'\CascadiaCode.zip'

Write-Host "Attempting to download Cascadia Code" -ForegroundColor Green
Invoke-WebRequest -Uri https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CascadiaCode.zip -OutFile $downloadLocation

$todoistLocation = $tempLocation +'\todoist.exe'

Invoke-WebRequest -Uri https://todoist.com/windows_app -OutFile $todoistLocation

$outLocation = $env:USERPROFILE + '\Temp\CascadiaCode'

Write-Host "Attempting to extract Cascadia Code" -ForegroundColor Green
Expand-Archive $downloadLocation -DestinationPath $outLocation

Write-Host "Attempting to delete Cascadia Code zip file" -ForegroundColor Green
Remove-Item $downloadLocation -Force

#Install DBA Tools
Install-Module dbatools -Scope CurrentUser -y

#Install Linux 
wsl --install -d Ubuntu-20.04

Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All


