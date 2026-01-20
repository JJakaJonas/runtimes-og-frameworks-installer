@echo off
CD /d %~dp0

echo.
echo Installation af andre runtimes
echo JJakaJonas
echo https://github.com/JJakaJonas/runtimes-og-frameworks-installer
echo.
echo Installere runtime pakker...
echo.
echo DirectX 9c...
cd DirectX 9c
start /wait DXSETUP.exe /silent
cd ..
echo.
echo XNA Framework Redistributable 4.0
msiexec /i xnafx40_redist.msi /qn
echo.
echo OpenAL...
start /wait OpenAL.exe /S

set IS_X64=0 && if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set IS_X64=1) else (if "%PROCESSOR_ARCHITEW6432%"=="AMD64" (set IS_X64=1))

if "%IS_X64%" == "1" goto X64

::X86 Installationer

goto END

:X64

::X64 Installationer

goto END

:END

echo.
color 0a
echo Installationen er færdig. 
TIMEOUT /T 5