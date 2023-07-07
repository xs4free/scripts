## uninstall Teams (personal)
Get-AppxPackage -Name MicrosoftTeams -AllUsers | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue

## https://andrewstaylor.com/2023/02/10/removing-teams-chat-from-windows-11-via-powershell-and-intune/

##Tweak reg permissions
# Invoke-WebRequest -uri "https://github.com/andrew-s-taylor/public/raw/main/De-Bloat/SetACL.exe" -outfile "C:\Windows\Temp\SetACL.exe"
# C:\Windows\Temp\SetACL.exe -on "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Communications" -ot reg -actn setowner -ownr "n:administrators"
# C:\Windows\Temp\SetACL.exe -on "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Communications" -ot reg -actn ace -ace "n:administrators;p:full"
# Remove-Item C:\Windows\Temp\SetACL.exe -recurse


## Stop Teams (personal) coming back
# $registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Communications"
# If (!(Test-Path $registryPath)) { 
#     New-Item $registryPath
# }
# Set-ItemProperty $registryPath ConfigureChatAutoInstall -Value 0

## Unpin Teams (personal) 
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Chat"
If (!(Test-Path $registryPath)) { 
    New-Item $registryPath
}
Set-ItemProperty $registryPath "ChatIcon" -Value 2
Write-Host "Removed Teams Chat"

## Show file extension in File Explorer
Set-Itemproperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'HideFileExt' -value 0
Write-Host "File extension configured"

## Show full path in title File Explorer
Set-Itemproperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState' -Name 'FullPath' -value 1
Write-Host "Show full path in title configured"

## Show option run-as-different-user in start
Set-Itemproperty -path 'HKCU:\\Software\Policies\Microsoft\Windows\Explorer' -Name 'ShowRunAsDifferentUserInStart' -value 1
Write-Host "Show option run-as-different-user in start configured"