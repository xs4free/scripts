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

## unpin Teams (personal) from taskbar
$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
If (!(Test-Path $registryPath)) { 
    New-Item $registryPath
}
Set-ItemProperty $registryPath -Name 'TaskbarMn' -Value 0
Write-Host "Unpinned Teams Chat from taskbar"

## Hide Teams (personal) app in Taskbar settings
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Chat"
If (!(Test-Path $registryPath)) { 
    New-Item $registryPath
}
Set-ItemProperty $registryPath -Name 'ChatIcon' -Value 3
Write-Host "Hidden Teams Chat from Taskbar Settings"

## Show file extension in File Explorer
Set-Itemproperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'HideFileExt' -value 0
Write-Host "Show file extensions in File Explorer configured"

## Show full path in title File Explorer
Set-Itemproperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState' -Name 'FullPath' -value 1
Write-Host "Show full path in title File Explorer configured"

## GIT config
git config --global --add --bool push.autoSetupRemote true
Write-Host "Git push.autSetupRemote configured"
