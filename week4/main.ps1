function GetApacheLogs {
    
    

    $logs = Get-Content -Path "C:\xampp\apache\logs\access.log"
    $a = @()

    for($i=0; $i -lt $logs.Count; $i++) {
    $split_logs = $logs[$i].Split() 
    $a += [pscustomobject]@{"IP" = $split_logs[0];
                        "Time" = $split_logs[3];
                        "Method" = $split_logs[5];
                        "Page" = $split_logs[6];
                        "Protocol" = $split_logs[7];
                        "Response" = $split_logs[8];
                        "Referrer" = $split_logs[10];
                        }

}
return $a
}