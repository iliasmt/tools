@echo off
Title Information Tool
@echo off
:start
echo INFO: Getting system info ...
REm start msinfo32 /nfo %loc%\export.nfo
set loc=%userprofile%\appdata\local\info
rd /s /q %loc%
@ping 127.0.0.1 -n 2 -w 1000 > nul
cls
echo INFO: Getting system info ...
md %userprofile%\appdata\local\info
echo. >>"%loc%\export.txt"
echo ~~~~~~~~~~~DATE-TIME-INFO~~~~~~~~~~~~~~~~>>"%loc%\export.txt"
for /F "usebackq tokens=1,2 delims==" %%i in (`wmic os get LocalDateTime /VALUE 2^>NUL`) do if '.%%i.'=='.LocalDateTime.' set ldt=%%j
set ldt=%ldt:~6,2%-%ldt:~4,2%-%ldt:~0,4% %ldt:~8,2%:%ldt:~10,2%
echo System Date and Time: %ldt% >> "%loc%\export.txt"
cscript C:\Windows\System32\slmgr.vbs /dli >>"%loc%\activation.txt"
echo. >>"%loc%\export.txt"
echo ~~~~~~~~~~~~~ACTIVATION-INFO~~~~~~~~~~~~~>>"%loc%\export.txt"
type "%loc%\activation.txt" |find "License Status:" >>"%loc%\export.txt"
type "%loc%\activation.txt" |find "Volume activation expiration:" >>"%loc%\export.txt"
type "%loc%\activation.txt" |find "Configured Activation Type:" >>"%loc%\export.txt"

systeminfo >>"%loc%\sysinfo.txt"

echo. >>"%loc%\export.txt"
echo ~~~~~~~~~~~~~WINDOWS-INFO~~~~~~~~~~~~~>>"%loc%\export.txt"
cls
echo INFO: Getting system info ...
type "%loc%\sysinfo.txt" |find "Host Name" >>"%loc%\export.txt"
type "%loc%\sysinfo.txt" |find "Original Install Date" >>"%loc%\export.txt"
type "%loc%\sysinfo.txt" |find "OS Name" >>"%loc%\export.txt"
type "%loc%\sysinfo.txt" |find "OS Version" >>"%loc%\export.txt"
type "%loc%\sysinfo.txt" |find "System Type" >>"%loc%\export.txt"
type "%loc%\sysinfo.txt" |find "System Locale" >>"%loc%\export.txt"
type "%loc%\sysinfo.txt" |find "Time Zone" >>"%loc%\export.txt"
echo. >>%loc%\export.txt"

wmic cpu get name >>"%loc%\cpu.txt"
echo ~~~~~~~~~~~~~Hardware-INFO~~~~~~~~~~~~~>>"%loc%\export.txt"
type "%loc%\cpu.txt"|findstr -i -r "Intel AMD" >>"%loc%\export.txt"
type "%loc%\sysinfo.txt" |find "Total Physical Memory" >>"%loc%\export.txt"
type "%loc%\sysinfo.txt" |findstr /c:"System Manufacturer" >>"%loc%\export.txt"
type "%loc%\sysinfo.txt" |findstr /c:"System Model" >>"%loc%\export.txt"
WMIC path Win32_VideoController get /format:list |findstr /c:"VideoProcessor" >>"%loc%\export.txt"
WMIC path Win32_VideoController get /format:list |findstr /c:"Description" >>"%loc%\export.txt"
WMIC path Win32_VideoController get /format:list |findstr /c:"Name" >>"%loc%\export.txt"
echo. >>%loc%\export.txt"

wmic UserAccount get disabled,name >>"%loc%\users.txt"
echo ~~~~~~~~~~~~~Users-INFO~~~~~~~~~~~~~>>"%loc%\export.txt"
type "%loc%\users.txt" >>"%loc%\export.txt"

REM powershell.exe  Get-WmiObject -Class Win32_WinSAT >>%loc%\winsat.txt
REM wmic path Win32_WinSAT get CPUScore, D3DScore, DIskScore, GraphicsScore, MemoryScore, WinSPRLevel >>%loc%\winsat.txt
cls
echo INFO: Getting system info ...
echo. >>"%loc%\export.txt"
echo ~~~~~~~~~~~~~WINSAT-INFO~~~~~~~~~~~~~>>"%loc%\export.txt"
wmic path Win32_WinSAT get CPUScore, D3DScore, DIskScore, GraphicsScore, MemoryScore, WinSPRLevel >>"%loc%\export.txt"
REM type "%loc%\winsat.txt" |find "CPUScore" >>"%loc%\export.txt"
REM type "%loc%\winsat.txt" |find "D3DScore" >>"%loc%\export.txt"
REM type "%loc%\winsat.txt" |find "DiskScore" >>"%loc%\export.txt"
REM type "%loc%\winsat.txt" |find "GraphicsScore" >>"%loc%\export.txt"
REM type "%loc%\winsat.txt" |find "MemoryScore" >>"%loc%\export.txt"
cls
echo INFO: Getting system info ...
regedit /e "%loc%\info.reg" "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion"
@ping 127.0.0.1 -n 5 -w 1000 > nul
cls
echo INFO: Getting system info ...
ECHO.>>"%loc%\export.txt"
echo ~~~~~~~~~~~~~BUILD-INFO~~~~~~~~~~~~~~~~>>"%loc%\export.txt"
type "%loc%\info.reg" |find "BuildLab" >>"%loc%\export.txt"
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>>"%loc%\export.txt"
ECHO.

cls
echo INFO: Getting system info ...
REM notepad "%loc%\export.txt"

set weblog="%loc%\export.html"
set bggrn="#396395"
set txtgrn="#00FF00"
echo ^<html^> >%weblog%
echo ^<head^> >>%weblog%
echo ^<meta http-equiv="refresh" content="15"^> >>%weblog%
echo ^<title^>Final Status^</title^> >>%weblog%
echo ^</head^> >>%weblog%
echo ^<body bgcolor=%bggrn% text=%txtgrn%^> >>%weblog%
echo ^<pre^> >>%weblog%
type %loc%\export.txt >> "%loc%\export.html"
echo ^</pre^> >>%weblog%
echo ^</body^> >>%weblog% 
echo ^</html^> >>%weblog%
CLS
%loc%\export.html


set /p ch=Do you want to keep this file? (y/n)
ECHO.
IF "%ch%"=="y"  (
copy /y "%loc%\export.html" "%userprofile%\Desktop\%COMPUTERNAME%.html" 
)
rd /s /q %loc%

