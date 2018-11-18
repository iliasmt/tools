@echo off
mode con: cols=100 lines=60
title .:: net stuff ::.
set T1=%time:~0,2%-%time:~3,2%-%time:~6,2%
ECHO.
echo .:!!! NEW SETTINGS APPLY ONLY AFTER SYSTEM RESTART !!!:.
ECHO.
:start
netsh interface show interface >> %userprofile%/Desktop/%T1%-network.txt
ipconfig >> %userprofile%/Desktop/%T1%-network.txt
route print -4 >> %userprofile%/Desktop/%T1%-network.txt
set res=false
ECHO.
ECHO %T1%-network.txt was created on desktop with current configuration
ECHO AN ADVANCED USER CAN REFERENCE THE ABOVE FILE TO RESTORE SETTINGS
ECHO.
set /p ch=Do you want to reset network? (y/n)
ECHO.

(if  "%ch%"=="Y" set res=true) && (if  "%ch%"=="y" set res=true)
if "%res%" == "false" exit
if "%res%" == "true" GOTO reset

:reset
set /p ch1=Are you sure you want to reset (y/n) ?
if  "%ch1%"=="n" exit
IF "%ch1%"=="y"  {
ECHO.
echo INFO : RESET IS STARTING
ECHO.
ipconfig /release
ipconfig /renew
ipconfig /flushdns
netsh int reset all
netsh int ip reset resettcpip.txt
netsh int ipv4 reset
netsh int ipv6 reset
netsh winsock reset } 
echo Now please MANUALLY REBOOT computer
pause