
#$output = Get-PnpDevice -Class "USB" | Sort-Object status -Descending | Select-Object -First 10
#Write-Output -NoEnumerate $output
#$output.GetType().FullName
#Write-Output $output
$output = Get-PnpDevice -Class "USB" | Sort-Object status -Descending | Select-Object -First 10
Out-String -InputObject $output -Width 100


   

