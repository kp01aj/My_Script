############################
# kp01
# Date August 10 2020
############################

#Set permises
Set-ExecutionPolicy Unrestricted -Scope CurrentUser

#Variables
#PATH Verification.
if ((Test-Path $HOME\Desktop)) {
    $RUTA1="$HOME\Pictures"
    $RUTA2="$HOME\Desktop"
} else {
    $RUTA1="$HOME\Imagenes"
    $RUTA2="$HOME\Escritorio"
}

$PAQ_INSTALL="$RUTA2\PAQ-INSTALL"

#1
#Apps Restrict.
#==============
Set-Location -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\
New-Item -Path . -name 'Explorer'
Set-Location .\Explorer\
New-ItemProperty -Path . -name 'RestrictRun' -value '1' -propertyType "DWord" -force
New-Item -Path . -name 'RestrictRun'

#2
# Add apps
Set-Location -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\RestrictRun\
New-ItemProperty -Path . -name '1' -value 'AnyDeskMSI.exe' -propertyType "string"
New-ItemProperty -Path . -name '2' -value 'Zoom.exe' -propertyType "string"
New-ItemProperty -Path . -name '3' -value 'Time Doctor.exe' -propertyType "string"
New-ItemProperty -Path . -name '4' -value 'GenesysSoftphone.exe' -propertyType "string"

#3 
#USB Block
#=========
Set-Location -Path HKCU:\System\CurrentControlSet\
New-Item -Path . -name 'Services'

Set-Location -Path .\Services\
New-Item -Path . -name 'USBTOR'

Set-Location -Path .\USBTOR\
New-ItemProperty -Path . -name 'Start' -value '4' -propertyType "DWord" -force

#4
#Set Background
# Move imagen.
Set-Location $PAQ_INSTALL
Move-Item -Path .\wallpaper.jpg -Destination $RUTA1

# set Regedit for Background
Set-Location -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\
New-Item -Path . -name 'System'

Set-Location -Path  .\System\
New-ItemProperty -Path . -name 'Wallpaper' -value "$RUTA1\wallpaper.jpg" -propertyType "string"
New-ItemProperty -Path . -name 'WallpaperStyle' -value '4' -propertyType "string"

#Change Location
Set-Location -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\

#5
#Restrict all drives
New-ItemProperty -Path . -name 'NoViewOnDrive' -value 0x3ffffff -propertyType "DWord" -force

#8
#Disable Access to Control Panel
New-ItemProperty -Path . -name 'NoControlPanel' -value '1' -propertyType "DWord" -force

#13
#Enable and Configure Windows Update 
Set-Location -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\
New-Item -Path . -name 'WindowsUpdate'

Set-Location -Path .\WindowsUpdate\
New-Item -Path . -name 'AU'

Set-Location -Path .\AU\
New-ItemProperty -Path . -name 'NoAutoUpdate' -value '0' -propertyType "DWord" -force
New-ItemProperty -Path . -name 'AUOptions' -value '3' -propertyType "DWord" -force
New-ItemProperty -Path . -name 'ScheduledInstallDay' -value '0' -propertyType "DWord" -force

#15
#Enable Location Services
Set-Location -Path HKLM:\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration\
New-ItemProperty -Path . -name 'Status' -value '1' -propertyType "DWord" -force

#16
#Disabled a Proxy
Set-Location -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\
New-Item -Path . -name 'Internet'

Set-Location -Path .\Internet\
Set-ItemProperty -Path . Settings\ProxyEnable -value '1' -force

#20
#Disable Run Diferent 
Set-Location -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer
New-ItemProperty -Path . -name 'NoStartBanner' -value '' -propertyType "DWord" -force

#Delete
Set-Location HKLM:\SOFTWARE\Classes\batfile\shell\ 
Remove-Item .\runasuser\ -Recurse
Remove-Item .\runas\ -Recurse

Set-Location HKLM:\SOFTWARE\Classes\cmdfile\shell\
Remove-Item .\runasuser\ -Recurse
Remove-Item .\runas\ -Recurse

Set-Location HKLM:\SOFTWARE\Classes\exefile\shell\ 
Remove-Item .\runasuser\ -Recurse
Remove-Item .\runas\ -Recurse

Set-Location HKLM:\SOFTWARE\Classes\mscfile\shell\
Remove-Item .\runasuser\ -Recurse
Remove-Item .\runas\ -Recurse

#01
# Disable CMD
Set-Location -Path HKCU:\SOFTWARE\Policies\Microsoft\Windows\
New-Item -Path . -name 'System'

Set-Location -Path .\System\
New-ItemProperty -Path . -name 'DisableCMD' -value '1' -propertyType "Dword" -force

#02
# Disable PowerShell
Set-Location -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
New-ItemProperty -Path . -name 'DisableRegistryTools' -value '1' -propertyType "Dword" -force
