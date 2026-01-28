if (Get-Process | Where-Object ProcessName -eq "chrome" ) {
    if (Get-Service | Where-Object {$_.status -eq "Running"} ) {
        Stop-Process -Name "Chrome"
    }
}
else{
Start-Process chrome.exe -ArgumentList "https://www.champlain.edu"
}