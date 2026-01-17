@echo off
REM  --> Check for permissions  
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"  

REM --> If error flag set, we do not have admin.  
if '%errorlevel%' NEQ '0' (  
    echo Requesting administrative privileges...  
    goto UACPrompt  
) else ( goto gotAdmin )  

:UACPrompt  
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"  
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B  

:gotAdmin  
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )   
    pushd "%CD%"  
    CD /D "%~dp0"  

title runtimes og .NET Framework installation
chcp 65001
echo.
echo runtimes og frameworks installer
echo JJakaJonas
echo https://github.com/JJakaJonas/runtimes-og-frameworks-installer
echo.
echo Dette script vil køre 3 andre scripts som hver køre nogle installationer.
echo hvert script vil lave en pause på 5 sekunder før det køre videre til det næste.
echo.
TIMEOUT /T 10
echo Installere runtimes og .NET Framework pakker...
Cls
echo Starter installation af Microsoft Visual C++ runtimes...
cd cpp
call install_all.bat
cd ..
echo Færdigt.
Cls
color 07
echo Starter installation af .NET Framwork pakker...
cd dotnet
call install_all.bat
cd ..
echo Færdigt.
cls
color 07
echo Starter installation af andre runtimes...
cd andet
call install_all.bat
cd ..
echo Færdigt.
cls
color 07
echo.
color 0a
echo Alle ting er nu installeret.
echo Genstart maskinen og check for opdateringer.
pause