. (Join-Path C:\Users\champuser\SYS320-01\week4 main.ps1)
. (Join-Path C:\Users\champuser\SYS320-01\week6 Event-Logs.ps1)
#. (Join-Path C:\Users\champuser\SYS320-01\week6 main-1.ps1 )
#. (Join-Path C:\Users\champuser\SYS320-01\week2 process_management_1.ps1)

$choice = 0

while ($choice -ne 5) {
  Write-Host "`nMain Menu: Pick an Option`n"
  Write-Host "1. Display the last 10 Apache logs`n" 
  Write-Host "2. Display the last 10 failed logins for all users`n" 
  Write-Host "3. Display at-risk users (users who failed login >9 times)`n" # Idea for criteria borrowed from Matt Compton
  Write-Host "4. Start Chrome web browser and navigate it to champlain.edu`n" 
  Write-Host "5. Exit`n" 

  $choice = Read-Host -Prompt "Enter your choice (1-5)"
  
    if ($choice -eq 1) {
    Write-Host "Displaying Last 10 Apache Logs:`n"
    GetApacheLogs | Select-Object -Last 10 | Format-Table -AutoSize -Wrap
    }
    elseif ($choice -eq 2) {
      getFailedLogins
    }
    elseif ($choice -eq 3) {
      $numberDays2 = Read-Host -Prompt "Please enter the amount of days youd liek to search back"
      $failedLogins = getFailedLogins $numberDays2 | Group-Object -Property User | Where-Object { $_.Count -gt 10}
      Write-Host ($failedLogins | Select-Object Name, Count | Format-Table | Out-String)
    }
    elseif ($choice -eq 4) {
    
        if (Get-Process | Where-Object ProcessName -eq "chrome" ) {
            if (Get-Service | Where-Object {$_.status -eq "Running"} ) {
                Stop-Process -Name "Chrome"
    }
}
        else{
        Start-Process chrome.exe -ArgumentList "https://www.champlain.edu"
}
    }
    elseif ($choice -eq 5) {
        Write-Host "menu exited"
    }
    else {
    Write-Host "Invalid input. Enter an integer between 1 and 5."
    }
}