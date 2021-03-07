@echo off
title .:: choco tool ::.
echo.
echo This tool will install chocolatey and other software. initial software setup
echo.
set /p ch=Do you want to install chocolatey (y/n)
echo.

IF /i "%ch%"=="y" (
    GOTO :install_choco
) ELSE (
    GOTO :eof
)

:install_choco
reg query HKU\S-1-5-19 1>nul 2>nul || GOTO :require_admin
echo.
echo INFO : Install chocolatey
powershell -Command "& Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
GOTO :software_install

:software_install
reg query HKU\S-1-5-19 1>nul 2>nul || GOTO :require_admin
set /p ch=Do you want to install MIN/FULL software to computer (MIN/FULL)
echo.

IF /i "%ch%"=="min" (
    GOTO :install_software_minimal
)
IF /i "%ch%"=="full" (
    GOTO :install_software_full
)

:require_admin
echo.
echo ERROR : This script requires administrator privileges.
echo.
pause
GOTO :eof

:install_software_full
echo.
echo INFO : This will install the following programs on your computer
echo INFO : googlechrome ublockorigin-chrome https-everywhere-chrome 7zip firefox  bsplayer  vlc sumatraPDF bulk-crap-uninstaller intel-driver-update-utility microsoft-windows-terminal IrfanView
echo.
set /p ch=Do you want to continue (y/n)
echo.

IF /i "%ch%"=="y" (
    choco install -y ^
    googlechrome ^
    ublockorigin-chrome ^
    https-everywhere-chrome ^
    7zip ^
    firefox ^
    bsplayer ^
    vlc ^
    sumatraPDF ^
    bulk-crap-uninstaller ^
    intel-driver-update-utility ^
    microsoft-windows-terminal ^
    IrfanView
) ELSE (
    GOTO :eof
)

:install_software_minimal
echo.
echo INFO : This will install the following programs on your computer
echo INFO : googlechrome ublockorigin-chrome https-everywhere-chrome 7zip vlc
echo.
set /p ch=Do you want to continue (y/n)
echo.

IF /i "%ch%"=="y" (
    choco install -y ^
    googlechrome ^
    ublockorigin-chrome ^
    https-everywhere-chrome ^
    7zip ^
    vlc
) ELSE (
    GOTO :eof
)
