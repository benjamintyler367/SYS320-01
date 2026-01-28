#(Get-NetIPAddress -AddressFamily IPv4 | Where-Object {$_.InterfaceAlias -ilike "Ethernet"}).IPAddress

#(Get-NetIPAddress -AddressFamily IPv4 | Where-Object {$_.InterfaceAlias -ilike "Ethernet"}).PrefixLength

#Get-WmiObject -List | Where-Object { $_.Name -ilike "Win32_Net*" } | Sort-Object Name

#Get-CimInstance Win32_NetworkAdapterConfiguration -Filter "DHCPEnabled='True'" | select DHCPServer | Format-Table -HideTableHeaders

#(Get-DnsClientServerAddress -AddressFamily IPv4 | Where-Object { $_.InterfaceAlias -ilike "*Ethernet*" } ).ServerAddresses[0]

#cd $PSScriptRoot

#$files=(Get-ChildItem)
#for ($j=0; $j -le $files.count; $j++){

#    if ($files[$j].name -ilike "*ps1"){
#        Write-Host $files[$j].name
#    }
#}

#$folderpath="$PSScriptRoot\outfolder"
#if (Test-Path $folderpath){
#    Write-Host "Folder Already Exists"
#}
#else {New-Item -Path $folderpath}

cd $PSScriptRoot
$files=(Get-ChildItem)

$folderpath = "$PSScriptRoot/outfolder/"
$filePath = Join-Path $folderpath "out.csv"

$files | Where-Object { $_.Extension -eq ".ps1" } | `
Export-Csv -Path $filePath

#$files = Get-ChildItem -Recurse -File
#$files | Where-Object { $_.Extenstion -eq '.csv' } | Rename-Item -NewName {$_.Name -replace '.csv', '.log'}
#Get-ChildItem -Recurse -File