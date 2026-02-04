#Get-EventLog System -Source Microsoft-Windows-Winlogon

function Get-LoginLogoutRecords {
    param(
        [Parameter(Mandatory=$true)]
        [int]$Days
    )

    $loginouts = Get-EventLog System -Source Microsoft-Windows-Winlogon -After (Get-Date).AddDays(-$Days)

    $loginoutsTable = @()
    for($i=0; $i -lt $loginouts.Count; $i++){

    $event = ""
    if($loginouts[$i].InstanceId -eq 7001) {$event="Logon"}
    if($loginouts[$i].InstanceId -eq 7002) {$event="Logon"}

    $user = $loginouts[$i].ReplacementStrings[1]
    $SID = New-Object System.Security.Principal.SecurityIdentifier($user)
    $new_user = $SID.Translate([System.Security.Principal.NTAccount])

    $loginoutsTable += [pscustomobject]@{"Time" = $loginouts[$i].TimeGenerated        
                                         "ID" = $loginouts[$i].InstanceId
                                         "Event" = $event;
                                         "User" = $new_user.Value

                                        }
    }
    return $loginoutsTable
}
##$results = Get-LoginLogoutRecords -Days 14
## $results

function Get-StartShutdownRecords {
    param(
        [Parameter(Mandatory=$true)]
        [int]$Days
    )

    $events = Get-EventLog System -After (Get-Date).AddDays(-$Days) | Where-Object {$_.EventID -eq 6005 -or $_.EventID -eq 6006}

    $eventsTable = @()

    for($i=0; $i -lt $events.Count; $i++){
        $event = ""
        if($events[$i].EventID -eq 6005) {$event="Startup"}
        if($events[$i].EventID -eq 6006) {$event="Shutdown"}

        $eventsTable += [pscustomobject]@{
            "Time" = $events[$i].TimeGenerated
            "ID" = $events[$i].EventID
            "Event" = $event;
            "User" = "System"
        }
    }
    return $eventsTable
}

#$Write-Host "`n=== Login/Logout Records ===" -ForegroundColor Cyan
$loginResults = Get-LoginLogoutRecords -Days 14
$loginResults

$shutdownResults = Get-StartShutdownRecords -Days 14
$shutdownResults