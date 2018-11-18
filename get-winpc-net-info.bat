@echo off
::mode con: cols=100 lines=60
title .:: net info ::.  """Network interfaces"""
echo List network interfaces
ECHO.
netsh interface show interface
echo NEXT STEP: ipconfig /all
pause
cls
title .:: net info ::.  """ipconfig"""
ipconfig /all
ECHO.
ECHO.
echo NEXT STEP: show mac address
pause
cls
title .:: net info ::.  """mac address"""
getmac /V
ECHO.
ECHO.
echo NEXT STEP: route print
pause
cls
title .:: net info ::.  """route print"""
route print -4
ECHO.
ECHO.
echo NEXT STEP: view hosts file
pause
cls
title .:: net info ::.  """hosts file"""
type c:\windows\system32\drivers\etc\hosts
pause