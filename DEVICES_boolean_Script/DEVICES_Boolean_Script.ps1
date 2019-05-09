$regex = '.*VID_(?<vid>[0-9A-F]{4})&PID_(?<pid>[0-9A-F]{4}).*'
$output=Invoke-Command { Get-WmiObject Win32_PNPEntity | Where { $_.DeviceID -in "PCI\VEN_8086&DEV_1916&SUBSYS_8079103C&REV_07\3&11583659&0&10"}} |
 foreach { if ($_.deviceid -match $regex -and $_deviceid) { add-member -inputobject $_  @{VID=$matches['vid']; PID=$matches['pid']} -passthru } else { $_ }}| 
 Sort-Object -Property PNPClass | Format-Table Name,Status,DeviceID,vid, pid,manufacturer
#Out-String -InputObject $output -Width 600
if($output){
    Write-Output "1" 

} else {
    Write-Output "0"
}