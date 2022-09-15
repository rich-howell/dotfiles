$SettingsPath = "$env:APPDATA\Code\User\"
$RemotePath = "D:\workspace\dotfiles\VsCode"
$ExtensionListFile = "vs_code_extensions_list.txt"
$ReinstallFile = "InstallVSCodeExtensions.ps1" 
 
code --list-extensions > "$RemotePath\$ExtensionListFile"
 
Copy-Item -Path "$SettingsPath\*" -Destination $RemotePath -Recurse -Force -Exclude @("workspaceStorage", "globalStorage")
 
if(-Not (Test-Path("$RemotePath\$ReinstallFile"))) {
    $FileContents = '$RemotePath = "'+ $RemotePath +'"
$ExtensionList = "' + $ExtensionListFile + '"
 
foreach($line in Get-Content "$RemotePath\$ExtensionList") {
    code --install-extension $line
}'
    New-Item -Path "$RemotePath\$ReinstallFile" -ItemType "File" -Value $FileContents
}