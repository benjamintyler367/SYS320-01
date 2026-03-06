function ChooseTimeToRun($Time){
    $scheduledTasks = Get-ScheduledTask | Where-Object { $_.TimeName -ilike "MyTask" }

    if ($scheduledTasks -ne $null) {
        Write-Host "The task already exists." | Out-String
        DisableAutoRun
        return
    }
    Write-Host "create a new task" | Out-String

    $action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File `C:\Users\champuser\SYS-320\week7\main.ps1`""
    $trigger = New-ScheduledTaskTrigger -Daily -At $Time
    $principle = New-ScheduledTaskPrincipal -UserId 'champuser' -RunLevel Highest
    $settings = New-ScheduledTaskSettingsSet -RunOnlyIfNetworkAvailable -WakeToRun
    $task = New-ScheduledTask -Action $action -Principal $principle -Trigger $trigger -Settings $settings

    Register-ScheduledTask 'myTask' -InputObject $task -Force

    Get-ScheduledTask | Where-Object {$_.TaskName -ilike "myTask"}
}

function DisableAutoRun() {
    $scheduledTasks = Get-ScheduledTask | Where-Object {$_.TaskName -ilike "myTask"}

    if($scheduledTasks -ne $null){
        Write-Host "Unregistering the task." | Out-String
        Unregister-ScheduledTask -TaskName 'myTask' -Confirm:$false
    } else {
        Write-Host "The task is not registered." | Out-String
    }
}
