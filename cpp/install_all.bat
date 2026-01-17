@echo off
CD /d %~dp0

echo.
echo Microsoft Visual C++ 2005 - 2026 X86 + X64 installer
echo JJakaJonas
echo https://github.com/JJakaJonas/runtimes-og-frameworks-installer
echo.
echo Installere runtime pakker...

set IS_X64=0 && if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set IS_X64=1) else (if "%PROCESSOR_ARCHITEW6432%"=="AMD64" (set IS_X64=1))

if "%IS_X64%" == "1" goto X64

::X86 Installationer

echo 2005...
start /wait vcredist2005_x86.exe /q

echo 2008...
start /wait vcredist2008_x86.exe /qb

echo 2010...
start /wait vcredist2010_x86.exe /passive /norestart

echo 2012...
start /wait vcredist2012_x86.exe /passive /norestart

echo 2013...
start /wait vcredist2013_x86.exe /passive /norestart

echo 2015 - 2026...
start /wait vcredist2015_2026_x86.exe /passive /norestart

goto END

:X64

::X64 Installationer
echo 2005 x86...
start /wait vcredist2005_x86.exe /q
echo 2005 x64...
start /wait vcredist2005_x64.exe /q

echo 2008 x86...
start /wait vcredist2008_x86.exe /qb
echo 2008 x64...
start /wait vcredist2008_x64.exe /qb

echo 2010 x86...
start /wait vcredist2010_x86.exe /passive /norestart
echo 2010 x64...
start /wait vcredist2010_x64.exe /passive /norestart

echo 2012 x86...
start /wait vcredist2012_x86.exe /passive /norestart
echo 2012 x64...
start /wait vcredist2012_x64.exe /passive /norestart

echo 2013 x86...
start /wait vcredist2013_x86.exe /passive /norestart
echo 2013 x64...
start /wait vcredist2013_x64.exe /passive /norestart

echo 2015 - 2026 x86...
start /wait vcredist2015_2026_x86.exe /passive /norestart
echo 2015 - 2026 x64...
start /wait vcredist2015_2026_x64.exe /passive /norestart

goto END

:END

echo.
color 0a
echo Installationen er færdig.
TIMEOUT /T 5