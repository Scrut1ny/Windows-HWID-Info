@echo off
:MENU
cls
echo.
echo    HWID CHECK 
echo.
echo   [1] SN's
echo   [2] Info + SN's
echo   [3] Exit
echo.
set /p choice= ">> "
if '%Choice%'=='1' goto :choice1
if '%Choice%'=='2' goto :choice2
if '%Choice%'=='3' goto :choice3
echo Choice "%Choice%" isn't a valid option. Please try again. 
:choice1
cls
echo  PRODUCT ID
wmic os get SerialNumber
echo  SMBIOS
wmic csproduct get UUID
echo  BIOS
wmic bios get SerialNumber
echo  MOTHERBOARD
wmic baseboard get SerialNumber
echo  Chassis
wmic systemenclosure get SerialNumber
echo  CPU
wmic cpu SerialNumber
echo  DRIVES
wmic diskdrive get model,SerialNumber
echo  RAM
wmic memorychip get SerialNumber,PartNumber
echo  MAC ADDRESS
powershell "get-wmiobject win32_networkadapter | Where {-NOT [string]::IsNullOrEmpty($_.MACAddress)} | Select Name,MACAddress"
echo.
pause
goto :MENU
:choice2
cls
echo  PRODUCT ID
wmic os get SerialNumber,RegisteredUser,Manufacturer,Caption,BuildNumber
echo  SMBIOS
wmic csproduct get IdentifyingNumber,Name,UUID,Vendor
echo  BIOS
wmic bios get Manufacturer,SerialNumber
echo  MOTHERBOARD
wmic baseboard get Manufacturer,Product,SerialNumber
echo  Chassis
wmic systemenclosure get SerialNumber
echo  CPU (SN don't exist virtually, only on top of physical CPU)
wmic cpu get name,SerialNumber
echo  DRIVES
wmic diskdrive get model,SerialNumber
echo  RAM
wmic memorychip get SerialNumber,PartNumber
echo  MAC ADRESSES
wmic nic get macaddress,description,PhysicalAdapter,PermanentAddress,GUID
echo.
pause
goto :MENU
:choice3
cls
exit
