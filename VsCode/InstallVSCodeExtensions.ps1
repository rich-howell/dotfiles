$RemotePath = "D:\workspace\dotfiles\VsCode"
$ExtensionList = "vs_code_extensions_list.txt"
 
foreach($line in Get-Content "$RemotePath\$ExtensionList") {
    code --install-extension $line
}