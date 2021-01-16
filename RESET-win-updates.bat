@echo off
title .:: RESET windows updates ::.
ECHO.
ECHO This will delete old and pending files in the windows update directories
ECHO will restart some services
ECHO.
set /p ch=Do you want to reset windows update? (y/n)
ECHO.

IF /i "%ch%"=="y" (
    GOTO start
) ELSE (
    exit
)

:start
ECHO.
echo INFO : Windows Update RESET IS STARTING
ECHO.
net stop bits
net stop wuauserv
net stop appidsvc
net stop cryptsvc

del /s /q /f "%ALLUSERSPROFILE%\Application Data\Microsoft\Network\Downloader\*.*"
rmdir /s /q /f %systemroot%\SoftwareDistribution
rmdir /s /q /f %systemroot%\system32\catroot2

net start bits
net start wuauserv
net start appidsvc
net start cryptsvc
pause

