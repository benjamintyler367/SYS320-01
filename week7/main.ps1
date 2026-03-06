. (Join-Path $PSScriptRoot "config.ps1")
. (Join-Path $PSScriptRoot "email.ps1")
. (Join-Path $PSScriptRoot "scheduler.ps1")
. (Join-Path $PSScriptRoot "../week6/Event-Logs.ps1")

$configuration = readConfiguration

$failed = getFailedLogins $configuration.Days | Group-Object -Property User | Where-Object {$_.Count -gt 10} | Select-Object Name, Count 

SendAlertEmail ($failed | Format-Table | Out-String)


ChooseTimeToRun ($configuration.ExecutionTime)