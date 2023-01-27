@ECHO off
cls
cd "C:\Windows\System32"


:start
ECHO WARNING: USE AT YOUR OWN RISK
ECHO I AM NOT RESPONSIBLE FOR ANY DAMAGES
set /p c=Would you like to Continue [Y/N]?
CLS
if /I "%c%" NEQ "Y" exit

ECHO. 
ECHO 1. Windows Server 2022 Standard
ECHO 2. Windows Server 2022 Datacenter   
ECHO. 
ECHO 3. Windows Server 2019 Datacenter 
ECHO 4. Windows Server 2019 Standard  
ECHO 5. Windows Server 2019 Essentials
ECHO.
ECHO 6. Windows Server 2016 Datacenter  
ECHO 7. Windows Server 2016 Standard  
ECHO 8. Windows Server 2016 Essentials  
ECHO.
ECHO For Windows Server, versions 20H2, 2004, 1909, 1903, and 1809
ECHO 9. Datacenter  
ECHO 10. Standard  
ECHO 11. End

set choice=
set /p choice=Select Your Operating System to Continue.

:loop

set "productKey="

rem Windows Server 2022
if %choice%==1 set productKey=VDYBN-27WPP-V4HQT-9VMD4-VMK7H
if %choice%==2 set productKey=WX4NM-KYWYW-QJJR4-XV3QB-6VM33 
rem Windows Server 2019
if %choice%==3 set productKey=WMDGN-G9PQG-XVVXX-R3X43-63DFG
if %choice%==4 set productKey=N69G4-B89J2-4G8F4-WWYCC-J464C 
if %choice%==5 set productKey=WVDHN-86M7X-466P6-VHXV7-YY726 
rem Windows Server 2016
if %choice%==6 set productKey=CB7KF-BWN84-R7R2Y-793K2-8XDDG 
if %choice%==7 set productKey=WC2BQ-8NRM3-FDDYY-2BFGV-KHKQY 
if %choice%==8 set productKey=JCKRF-N37P4-C2D82-9YXRT-4M63B 
rem Windows Server, versions 20H2, 2004, 1909, 1903, and 1809
if %choice%==9 set productKey=6NMRW-2C8FM-D24W7-TQWMY-CWH2D
if %choice%==10 set productKey=N2KJX-J94YW-TQVFB-DG9YT-724CC
if %choice%==11 goto end

if "%productKey%"=="" (
    echo "%choice%" is not valid, try again
    goto start
)

rem Now that the productKey variable has been set, 
rem we can proceed to the next step of the process
rem Activating Windows

set eval=
set /p eval=Is this currently on an Eval License (Y/n)?

if "%eval%"=="Y" or "%eval%" =="y" (
    Dism /online /Set-Edition:ServerStandard /ProductKey:%productKey% /AcceptEula
	goto end
)

cscript slmgr.vbs /ipk %productKey%
cscript slmgr.vbs /skms kms8.msguides.com
cscript slmgr.vbs /ato


:end
ECHO THANKS FOR USING A 
ECHO Boss_Man PRODUCT
ECHO.
set /P c=Would You Like to quit[Y/N]?
CLS
if /I "%c%" EQU "Y" goto :Exit
if /I "%c%" EQU "N" goto :start