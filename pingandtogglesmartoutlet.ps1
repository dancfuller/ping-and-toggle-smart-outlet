$PC = "192.168.1.10"
$smartPlug = "192.168.1.11"
$bootWait = 15

if (-not (Test-Connection $linuxPC -Count 2 -Quiet)) {
    Write-Host "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - PC frozen, power cycling..."
    kasa --host $smartPlug --plug off
    Start-Sleep -Seconds $bootWait
    kasa --host $smartPlug --plug on
}
