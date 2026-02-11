. "C:\Users\champuser\SYS320-01\week4\main.ps1"
clear
$a = GetApacheLogs
Write-Host ($a | Format-Table -AutoSize | Out-String)