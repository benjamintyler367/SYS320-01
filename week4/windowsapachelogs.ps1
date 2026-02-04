#Deliverable 2:
#Get-Content -Path "C:\xampp\apache\logs\access.log" -Tail 5

#Deliverbale 3:
#Get-Content C:\xampp\apache\logs\access.log | Select-String ' 404 '

#Deliverbale 4:
#Get-Content C:\xampp\apache\logs\access.log | Select-String ' 200 ' -NotMatch

#Deliverable 5:
#Select-String -Path ./*.log -Pattern 'error'

#Deliverable 6:
#$ip = Get-Content C:\xampp\apache\logs\access.log | Select-String ' 404 '
#Write-Output $ip.ForEach({( $_ -split "\s+" )[0]})

#Deliverable 7:
$ip = Get-Content C:\xampp\apache\logs\access.log | Select-String ' 404 '
Write-Output $ip.ForEach({( $_ -split "\s+" )[0]}) | Group-Object -NoElement