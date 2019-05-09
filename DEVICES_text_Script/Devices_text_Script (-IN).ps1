#$output=Invoke-Command { Get-WmiObject Win32_PNPEntity | Where { $_.PNPClass -notin "SoftwareDevice"}} | Sort-Object -Property PNPClass | Format-Table Name,PNPDeviceID,Status,DeviceID
#Out-String -InputObject $output -Width 500

#La propiedad -notin indica que recoja todos los valores menos los que se indican a continuacion de este
$regex = '.*VID_(?<vid>[0-9A-F]{4})&PID_(?<pid>[0-9A-F]{4}).*'
$output=Invoke-Command { Get-WmiObject Win32_PNPEntity | Where { $_.PNPClass -in "SoftwareDevice","Media","USB","SmartCardReader","HIDClass"}} |
 foreach { if ($_.deviceid -match $regex) { add-member -inputobject $_  @{VID=$matches['vid']; PID=$matches['pid']} -passthru } else { $_ }}| 
 Sort-Object -Property PNPClass | Format-Table Name,Status,DeviceID,vid, pid
Out-String -InputObject $output -Width 600