$linuxPC = "192.168.1.10"
$smartPlug = "192.168.1.11"
# Time in seconds to wait with power off. Can be shortened, but 15 seconds was chosen
# to ensure the power-off process has fully completed and capacitors have drained.
$bootWait = 15

function Write-Log {
    param([string]$Message)
    Write-Host "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - $Message"
}

if (-not (Test-Connection $linuxPC -Count 2 -Quiet)) {
    Write-Log "Linux PC ($linuxPC) unreachable, attempting power cycle..."
    
    # Turn off the plug
    $offResult = kasa --host $smartPlug --plug off 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Log "ERROR: Failed to turn off smart plug ($smartPlug)"
        Write-Log "Detail: $offResult"
        Write-Log "Check: Is the plug online? Is the IP correct? Is kasa-cli installed?"
        exit 1
    }
    Write-Log "Plug turned OFF, waiting $bootWait seconds..."
    
    Start-Sleep -Seconds $bootWait
    
    # Turn on the plug
    $onResult = kasa --host $smartPlug --plug on 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Log "ERROR: Failed to turn on smart plug ($smartPlug)"
        Write-Log "Detail: $onResult"
        Write-Log "WARNING: Plug may be stuck OFF - check manually!"
        exit 1
    }
    Write-Log "Plug turned ON, power cycle complete."
    
} else {
    Write-Log "Linux PC ($linuxPC) is responding, no action needed."
}
