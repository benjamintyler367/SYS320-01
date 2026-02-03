#Get-EventLog System -Source Microsoft-Windows-Winlogon

$loginouts = Get-EventLog System -Source Microsoft-Windows-Winlogon -After (Get-Date).AddDays(-14)

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
$loginoutsTable

##Left off at question 4
