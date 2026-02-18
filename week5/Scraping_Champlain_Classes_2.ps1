. "C:\Users\champuser\SYS320-01\week5\Scraping_Champlain_Classes.ps1"
$rawClasses = gatherClasses
$classes = daysTranslator $rawClasses
#deliverable 1
#$classes | Where-Object {$_.Instructor -eq "Furkan Paligu"}

<#deliverable 2
pscustomobject

$classes | Where-Object {($_.Location -eq "FREE 105") -and ($_.days -eq "Wednesday")} | `
    Sort-Object "Time Start" | `
    Select-Object "Time Start", "Time End", "Class Code"
#>

<#Deliveranle 3 and 4

$its_instructors = $classes | Where-Object {
                             ($_."Class Code" -like "SYS*") -or `
                             ($_."Class Code" -like "SEC*") -or `
                             ($_."Class Code" -like "NET*") -or `
                             ($_."Class Code" -like "FOR*") -or `
                             ($_."Class Code" -like "CSI*") -or `
                             ($_."Class Code" -like "DAT*") } `
                             | Sort-Object "Instructor" -Unique `
                             | Select-Object -ExpandProperty "Instructor"
                             $its_instructors
                             #>
$classes | Where-Object {$_.Instructor -in $its_instructors } `
         | Group-Object "Instructor" | Select-Object Count, Name | Sort-Object Count -Descending