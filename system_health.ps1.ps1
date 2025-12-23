$cpu = (Get-Counter '\Processor(_Total)\% Processor Time').CounterSamples.CookedValue
$memory = (Get-Counter '\Memory\Available MBytes').CounterSamples.CookedValue
$disk = Get-PSDrive C
$uptime = (systeminfo | find "System Boot Time")

$report = [PSCustomObject]@{
    CPU_Usage_Percent = $cpu
    Available_Memory_MB = $memory
    Free_Disk_GB = $disk.Free / 1GB
    System_Uptime = $uptime
}

$report | Export-Csv -Path "SystemHealthReport.csv" -NoTypeInformation
