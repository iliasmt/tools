@echo off
TITLE :: Installed OS arch::

###########################################################
set ARCH=%PROCESSOR_ARCHITECTURE%
echo %ARCH%


if %ARCH%==x86 (
  set loc=x32
) else (
  set loc=x64
)

echo arch is %loc%
pause
###########################################################

###########################################################
cls
reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x32" > NUL && set OS=32BIT || set OS=64BIT

if %OS%==32BIT echo x86
if %OS%==64BIT echo x64
###########################################################

pause