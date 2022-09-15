#Install-Module dbatools -Scope CurrentUser -y

$SqlInstance = Find-DbaInstance -ComputerName localhost

Set-DbatoolsConfig -Name Path.SQLServerSetup -Value 'D:\images'

if (-eq $null $SqlInstance) {
   
    #ASK which version of SQL to install:
    [string]$Version = Read-Host -Prompt 'Install SQL Server Version (2008R2, 2012, 2014, 2016, 2019)'
 
    #Get SA credentials:
    $sacredential = Get-Credential
    
    #Install SQL Server:
    Install-DbaInstance -Version $Version -AuthenticationMode Mixed -Feature Engine -SaCredential $sacredential -Restart -PerformVolumeMaintenanceTasks -Confirm:$false
 }