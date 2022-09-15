$configDir = $env:USERPROFILE +'\.config\powershell'
$profileFileName = 'user_profile.ps1'
$jsonFileName = 'takuya.omp.json'


if(-Not(Test-Path -Path $configDir -PathType Leaf))
{
    Write-Host 
    New-Item -ItemType Directory -Path $env:USERPROFILE + '\' + $configDir  -Force -ErrorAction Stop
}

Invoke-WebRequest -Uri https://raw.githubusercontent.com/rich-howell/dotfiles/main/.config/powershell/user_profile.ps1 -OutFile $configDir + '\' + $profileFileName
Invoke-WebRequest -Uri https://raw.githubusercontent.com/rich-howell/dotfiles/main/.config/powershell/takuya.omp.json -OutFile $configDir + '\' + $jsonFileName


