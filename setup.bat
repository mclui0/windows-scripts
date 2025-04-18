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
echo Cat: This batch file will install basic essential programs onto your computer via winget.
echo Note that this script will open webpages in your default browser to install some programs.
echo.
echo The following programs will be installed with winget in this order:
echo 1. Git (Version Control)
echo 2. Visual Studio Code (IDE)
echo 3. Windows Terminal (Terminal Emulator)
echo 4. Python 3.11 (Python Interpreter)
echo 5. Steam (Gaming Platform)
echo 6. PowerToys (Utility Tools)
echo 7. Rainmeter (Widget Customization)
echo 8. Obsidian (Markdown Editor for Notes and Knowledge Management)
echo 9. WinSCP (File Transfer Client)
echo 10. WizTree (Disk Space Analyzer)
echo 11. HWiNFO (System Information and Monitoring)
echo 12. Everything Toolbar (Integrated Search Tool)
echo 13. Everything (Standalone Search Tool)
echo 14. GlassWire (Network Monitoring Tool)
echo 15. Krita (Digital Painting Software)
echo 16. PeaZip (File Archive/Unarchiver)
echo.
echo The following webpages will be opened in your default browser for installation:
echo 17. SpotX (Spotify Ad Blocker, https://github.com/SpotX-Official/SpotX/releases)
echo 18. Spicetify (Spotify Customization, https://spicetify.app/docs/getting-started/)
echo 19. Vencord (Discord Customization, https://vencord.dev/)
echo.
pause
echo.

:: Check if winget is available, and prompt for manual installation if missing
echo  /\_/\  
echo ( o.o ) 
echo  ^> ^^ ^<
echo Cat: Checking if winget is available...
echo If stuck, press any key to continue...
powershell -Command "if (-not (Get-Command winget -ErrorAction SilentlyContinue)) { Write-Output 'winget not found. Installing App Installer from Microsoft Store...'; Start-Process 'ms-windows-store://pdp/?productid=9NBLGGH4NNS1'; Write-Output 'Please install ''App Installer'' manually from the Store, then re-run this script.'; Pause; Exit 1 }" > nul 2>&1

:: Uncomment the following lines if you want to enable WSL and install Ubuntu
:: powershell -Command "dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart" > nul 2>&1
:: powershell -Command "dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart" > nul 2>&1
:: powershell -Command "wsl --set-default-version 2" > nul 2>&1
:: powershell -Command "winget install -e --id Canonical.Ubuntu" > nul 2>&1
:: powershell -Command "Read-Host 'Press Enter to reboot now and complete WSL installation...'; Restart-Computer" > nul 2>&1

:: Install essential packages using winget
echo  /\_/\  
echo ( o.o ) 
echo  ^> ^^ ^<
echo Cat: Installing Git...
:: powershell -Command "winget install -e --id Git.Git" > nul 2>&1
echo Cat: Installing Visual Studio Code...
:: powershell -Command "winget install -e --id Microsoft.VisualStudioCode" > nul 2>&1
echo Cat: Installing Windows Terminal...
:: powershell -Command "winget install -e --id Microsoft.WindowsTerminal" > nul 2>&1
echo Cat: Installing Python 3.11...
:: powershell -Command "winget install -e --id Python.Python.3.11" > nul 2>&1
echo Cat: Installing Steam...
:: powershell -Command "winget install -e --id Valve.Steam" > nul 2>&1
echo Cat: Installing PowerToys...
:: powershell -Command "winget install -e --id Microsoft.PowerToys" > nul 2>&1
echo Cat: Installing Rainmeter...
:: powershell -Command "winget install -e --id Rainmeter.Rainmeter" > nul 2>&1
echo Cat: Installing Obsidian...
:: powershell -Command "winget install -e --id Obsidian.Obsidian" > nul 2>&1
echo Cat: Installing WinSCP...
:: powershell -Command "winget install -e --id WinSCP.WinSCP" > nul 2>&1
echo Cat: Installing WizTree...
:: powershell -Command "winget install -e --id AntibodySoftware.WizTree" > nul 2>&1
echo Cat: Installing HWiNFO...
:: powershell -Command "winget install -e --id REALiX.HWiNFO" > nul 2>&1
echo Cat: Installing Everything Toolbar...
:: powershell -Command "winget install -e --id stnkl.EverythingToolbar" > nul 2>&1
echo Cat: Installing Everything...
:: powershell -Command "winget install -e --id voidtools.Everything" > nul 2>&1
echo Cat: Installing GlassWire...
:: powershell -Command "winget install -e --id GlassWire.GlassWire" > nul 2>&1
echo Cat: Installing Krita...
:: powershell -Command "winget install -e --id KDE.Krita" > nul 2>&1
echo Cat: Installing PeaZip...
:: powershell -Command "winget install -e --id Giorgiotani.Peazip" > nul 2>&1

:: Open webpages in the default browser
echo  /\_/\  
echo ( o.o ) 
echo  ^> ^^ ^<
echo Cat: Opening webpages...
start "" "https://github.com/SpotX-Official/SpotX/releases"
start "" "https://spicetify.app/docs/getting-started/"
start "" "https://vencord.dev/"

:: Finish 
echo  /\_/\  
echo ( o.o ) 
echo  ^> ^^ ^<
echo Cat: Done. Please restart your computer to ensure the changes take effect.
pause