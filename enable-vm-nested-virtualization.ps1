Get-VM |Format-Table -Wrap -AutoSize 

$vmName = Read-Host "Enter the name of the VM listed above you want to enable nested virtualization for"

# https://learn.microsoft.com/en-us/virtualization/hyper-v-on-windows/user-guide/enable-nested-virtualization#configure-nested-virtualization
Set-VMProcessor -VMName $vmName -ExposeVirtualizationExtensions $true

Write-Host "ExposeVirtualizationExtensions set to 'true' for '$vmName'"