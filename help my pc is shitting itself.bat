@echo off
chcp 65001 > nul 2>&1  & REM Enable UTF-8 for special characters
setlocal enabledelayedexpansion

:: Check for administrative privileges
net session > nul 2>&1
if %errorlevel% neq 0 (
    echo  /\_/\  
    echo ( o.o ^) 
    echo  ^> ^^ ^<
    echo Cat: This script requires administrative privileges. Please run it as an administrator.
    pause
    exit /b
)

echo  /\_/\  
echo ( o.o ) 
echo  ^> ^^ ^<
echo Cat: This batch file may help you fix your computer if it is shitting itself.
echo.
echo After creating a system restore point, it will run the following commands in order:
echo 1. chkdsk /f - Check and fix disk errors
echo 2. sfc /scannow - Check and fix system files
echo 3. dism /online /cleanup-image /restorehealth - Restore the health of the Windows image
:: 4. dism /online /cleanup-image /startcomponentcleanup /resetbase - Clean up the component store
echo.
pause
echo.

:: System restore checks and creation
echo  /\_/\  
echo ( o.o ) 
echo  ^> ^^ ^<
echo Cat: Checking if System Restore is enabled...
powershell -Command "Enable-ComputerRestore -Drive 'C:\'" > nul 2>&1

if %errorlevel% neq 0 (
    echo System Restore is disabled. Enabling it now...
    powershell -Command "Enable-ComputerRestore -Drive 'C:\'" > nul 2>&1
    echo System Restore has been enabled.
    timeout /t 5 > nul 2>&1
) else (
    echo System Restore is already enabled.
)

echo Creating a restore point...
powershell -Command "Checkpoint-Computer -Description 'Manual Restore Point' -RestorePointType 'MODIFY_SETTINGS'" > nul 2>&1

if %errorlevel% equ 0 (
    echo Restore point created successfully.
) else (
    echo Failed to create a restore point. Ensure you have administrative privileges.
)
echo.

:: Fix commands
echo  /\_/\  
echo ( o.o ) 
echo  ^> ^^ ^<
echo Cat: Running chkdsk /f...
chkdsk /f

echo.

echo  /\_/\  
echo ( o.o ) 
echo  ^> ^^ ^<
echo Cat: Running sfc /scannow...
sfc /scannow

echo.

echo  /\_/\  
echo ( o.o ) 
echo  ^> ^^ ^<
echo Cat: Running dism /online /cleanup-image /restorehealth...
dism /online /cleanup-image /restorehealth

echo.

echo  /\_/\  
echo ( o.o ) 
echo  ^> ^^ ^<
echo Cat: Running Microsoft Malicious Software Removal Tool...
mrt.exe

echo.

:: Finish 
echo  /\_/\  
echo ( o.o ) 
echo  ^> ^^ ^<
echo Cat: Done. Please restart your computer to ensure the changes take effect.
pause