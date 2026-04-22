function SendAlertEmail($body){
    $from = "benjamin.tyler@mymail.champlain.edu"
    $to = "benjamin.tyler@mymail.champlain.edu"
    $subject = "Suspicious Activity"

    $password = "" | ConvertTo-SecureString -AsPlainText -Force
    $credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $from, $password

    Send-MailMessage -From $from -To $to -Subject $subject -Body $body -SmtpServer "smtp.gmail.com" `
    -Port 587 -UseSsl -Credential $credential

}

