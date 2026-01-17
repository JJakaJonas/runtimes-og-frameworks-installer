@echo off
CD /d %~dp0

echo.
echo .NET Framework 3.5 og 4.8.1 installer
echo JJakaJonas
echo https://github.com/JJakaJonas/runtimes-og-frameworks-installer
echo.
echo Installere .Net Framework pakker...
echo.
echo installer / Aktiver .NET Framework 3.5
echo.

DISM /Online /Enable-Feature /FeatureName:NetFx3 /All /Source:sources\sxs /LimitAccess

set IS_X64=0 && if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set IS_X64=1) else (if "%PROCESSOR_ARCHITEW6432%"=="AMD64" (set IS_X64=1))

if "%IS_X64%" == "1" goto X64

::X86 Installationer

goto END

:X64

::X64 Installationer

goto END

:END

echo.
echo installer .NET Framework 4.8.1
start /wait ndp481-x86-x64-ALLOS-ENU.exe /q /norestart
echo.
echo installer .NET Framework 4.8.1 Sprogpakke (Dansk)
start /wait ndp481-x86-x64-allos-dan.exe /q /norestart /ChainingPackage "ADMIN"
echo.
color 0a
echo Installationen er færdig.
TIMEOUT /T 5