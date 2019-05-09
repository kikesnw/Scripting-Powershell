$output=Invoke-Command { Get-WmiObject Win32_PNPEntity | Where { $_.PNPClass -notin "SoftwareDevice","Media","Volume","DiskDrive"}} | Sort-Object -Property PNPClass | Format-Table Name, Manufacturer, PNPClass, Status
Out-String -InputObject $output -Width 500
