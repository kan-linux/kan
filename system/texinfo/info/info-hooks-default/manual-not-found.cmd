@echo off
Rem Copyright 2026 Free Software Foundation, Inc.

Rem Copying and distribution of this file, with or without modification,
Rem are permitted in any medium without royalty provided the copyright
Rem notice and this notice are preserved.

setlocal

set dir=%~dp0

set interactive=0
if "%1" == "--interactive" set interactive=1
if "%1" == "--interactive" shift

set lookupfile="%dir%gnu-manuals-locations.dat"
if not exist %lookupfile% goto nourl
for /f "usebackq" %%i in (`gawk -v "prog=%1" -f "%dir%gnu-manuals.awk" %lookupfile%`) do set url=%%i

set url > nul 2>&1
if ERRORLEVEL 1 exit /B 1

echo You could try visiting the following URL with a web browser to
echo download the Info manual, or to read the "%1" manual in other formats:
echo.
echo %url%

:nourl
Rem It is too much hassle to find out if a man page is installed given
Rem the different ports of man on Windows, so just assume it exists
if not "%interactive%" == "0" exit /B 0
echo You could try loading the manpage instead, with the link below:
echo.
echo * Menu:
echo.
echo * (*manpages*)%1::	%1 man page

endlocal
