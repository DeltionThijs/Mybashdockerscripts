# Create registry values
# alle regkeys die de cleanmgr.exe settings gebruiken met "alles aangevinkt"
$volumeCaches = Get-ChildItem "HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches"
foreach($key in $volumeCaches)
{
    New-ItemProperty -Path "$($key.PSPath)" -Name StateFlags0123 -Value 2 -Type DWORD -Force | Out-Null
	New-ItemProperty -Path "$($key.PSPath)" -Name StateFlags0123 -Value 2 -Type DWORD -Force | Out-Null
	New-ItemProperty -Path "$($key.PSPath)" -Name StateFlags0123 -Value 2 -Type DWORD -Force | Out-Null
	New-ItemProperty -Path "$($key.PSPath)" -Name StateFlags0123 -Value 0 -Type DWORD -Force | Out-Null
	New-ItemProperty -Path "$($key.PSPath)" -Name StateFlags0123 -Value 2 -Type DWORD -Force | Out-Null
	New-ItemProperty -Path "$($key.PSPath)" -Name StateFlags0123 -Value 2 -Type DWORD -Force | Out-Null
	New-ItemProperty -Path "$($key.PSPath)" -Name StateFlags0123 -Value 2 -Type DWORD -Force | Out-Null
	New-ItemProperty -Path "$($key.PSPath)" -Name StateFlags0123 -Value 2 -Type DWORD -Force | Out-Null
	New-ItemProperty -Path "$($key.PSPath)" -Name StateFlags0123 -Value 2 -Type DWORD -Force | Out-Null
	New-ItemProperty -Path "$($key.PSPath)" -Name StateFlags0123 -Value 2 -Type DWORD -Force | Out-Null
	New-ItemProperty -Path "$($key.PSPath)" -Name StateFlags0123 -Value 2 -Type DWORD -Force | Out-Null
	New-ItemProperty -Path "$($key.PSPath)" -Name StateFlags0123 -Value 2 -Type DWORD -Force | Out-Null
	New-ItemProperty -Path "$($key.PSPath)" -Name StateFlags0123 -Value 2 -Type DWORD -Force | Out-Null
	New-ItemProperty -Path "$($key.PSPath)" -Name StateFlags0123 -Value 2 -Type DWORD -Force | Out-Null
	New-ItemProperty -Path "$($key.PSPath)" -Name StateFlags0123 -Value 2 -Type DWORD -Force | Out-Null
	New-ItemProperty -Path "$($key.PSPath)" -Name StateFlags0123 -Value 2 -Type DWORD -Force | Out-Null
	New-ItemProperty -Path "$($key.PSPath)" -Name StateFlags0123 -Value 2 -Type DWORD -Force | Out-Null
	New-ItemProperty -Path "$($key.PSPath)" -Name StateFlags0123 -Value 0 -Type DWORD -Force | Out-Null
	New-ItemProperty -Path "$($key.PSPath)" -Name StateFlags0123 -Value 2 -Type DWORD -Force | Out-Null
}
 
# Execute Disk Cleanup Tool (cleanmgr.exe)
Start-Process -Wait "$env:SystemRoot\System32\cleanmgr.exe" -ArgumentList "/sagerun:123"
 
# Remove the previously created registry values
$volumeCaches = Get-ChildItem "HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches"
foreach($key in $volumeCaches)
{
    Remove-ItemProperty -Path "$($key.PSPath)" -Name StateFlags0123 -Force | Out-Null
}