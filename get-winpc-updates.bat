@echo off
title Find Specific Update

set /p KBNUM=Enter KB number to search ?:

REM disabled commands just in case
REM systeminfo |findstr %KBNUM%
REM Get-HotFix | Sort-Object InstalledOn -Descending |findstr %KBNUM%

REM wmic qfe list |findstr %KBNUM%

pause
