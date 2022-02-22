@echo off
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:start
curl -sL -o %0 https://raw.githubusercontent.com/SanCraftDev/Software-Installer/main/Installer.bat
FOR /F "usebackq" %%f IN (`PowerShell -NoProfile -Command "Write-Host([Environment]::GetFolderPath('Desktop'))"`) DO (
  SET "DESKTOP_FOLDER=%%f"
  )
C:
del /S /Q "%TMP%\Programm.msi"
del /S /Q "%TMP%\Programm.exe"
del /S /Q "%TMP%\Programm.bat"
CLS
echo.
echo  Mozilla Public License 2.0
echo.
echo  Copyright (c) 2022 SanCraft
echo.
echo  The latest Version of Mozilla Public License 2.0 can be found here: https://mozilla.org/en-US/MPL/2.0
echo.
echo  Do you accept this License?
echo.
echo  1. No
echo  2. Yes
echo.
CHOICE /C 12 /M " Selection: "
IF ERRORLEVEL 2 GOTO s
IF ERRORLEVEL 1 echo  Aborting... & pause & GOTO end

:s
CLS
echo.
echo  Welcome to the Software-Installer Installer!
echo.
echo  1. Install/Repair
echo  2. Remove
echo.
CHOICE /C 12 /M " Selection: "
IF ERRORLEVEL 2 GOTO rm
IF ERRORLEVEL 1 GOTO is

:is
CLS
echo  Start installation?
Pause
mkdir "%ProgramFiles%\Software-Installer"
mkdir "%appdata%\Microsoft\Windows\Start Menu\Programs\Software-Installer"
cd "%ProgramFiles%\Software-Installer"
curl -sL -o Software-Installer.bat https://raw.githubusercontent.com/SanCraftDev/Software-Installer/main/Software-Installer.bat
curl -sL -o Uninstaller-Installer.bat https://raw.githubusercontent.com/SanCraftDev/Software-Installer/main/Installer.bat
curl -sL -o Download.ico https://raw.githubusercontent.com/SanCraftDev/Software-Installer/main/Download.ico
curl -sL -o Installer.ico https://raw.githubusercontent.com/SanCraftDev/Software-Installer/main/Installer.ico

set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo  Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo  sLinkFile = "%appdata%\Microsoft\Windows\Start Menu\Programs\Software-Installer\Software-Installer.lnk" >> %SCRIPT%
echo  Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo  oLink.TargetPath = "%windir%\system32\cmd.exe" >> %SCRIPT%
echo  oLink.Arguments = "/C C:\PROGRA~1\Software-Installer\Software-Installer.bat" >> %SCRIPT%
echo  oLink.IconLocation = "%ProgramFiles%\Software-Installer\Download.ico" >> %SCRIPT%
echo  oLink.Save >> %SCRIPT%
cscript /nologo %SCRIPT%
del /S /Q %SCRIPT%

set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo  Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo  sLinkFile = "%appdata%\Microsoft\Windows\Start Menu\Programs\Software-Installer\Uninstaller-Installer.lnk" >> %SCRIPT%
echo  Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo  oLink.TargetPath = "%windir%\system32\cmd.exe" >> %SCRIPT%
echo  oLink.Arguments = "/C C:\PROGRA~1\Software-Installer\Uninstaller-Installer.bat" >> %SCRIPT%
echo  oLink.IconLocation = "%ProgramFiles%\Software-Installer\Installer.ico" >> %SCRIPT%
echo  oLink.Save >> %SCRIPT%
cscript /nologo %SCRIPT%
del /S /Q %SCRIPT%

CLS
echo  Scripts were saved in "%ProgramFiles%\Software-Installer"!
echo  Create Desktop-Shortcuts?
echo.
echo  1. Yes
echo  2. No
echo.
CHOICE /C 12 /M " Selection: "
IF ERRORLEVEL 2 GOTO if
IF ERRORLEVEL 1 GOTO l

:l
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo  Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo  sLinkFile = "%DESKTOP_FOLDER%\Software-Installer.lnk" >> %SCRIPT%
echo  Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo  oLink.TargetPath = "%windir%\system32\cmd.exe" >> %SCRIPT%
echo  oLink.Arguments = "/C C:\PROGRA~1\Software-Installer\Software-Installer.bat" >> %SCRIPT%
echo  oLink.IconLocation = "%ProgramFiles%\Software-Installer\Download.ico" >> %SCRIPT%
echo  oLink.Save >> %SCRIPT%
cscript /nologo %SCRIPT%
del /S /Q %SCRIPT%
GOTO if

:if
CLS
echo  Finished!
Pause
GOTO end

:end
exit /B

:rm
CLS
echo.
echo  Remove?
echo.
echo  1. Yes
echo  2. No
echo.
CHOICE /C 12 /M " Selection: "
IF ERRORLEVEL 2 GOTO end
IF ERRORLEVEL 1 GOTO rmy

:rmy
CLS
del /S /Q %DESKTOP_FOLDER%\Software-Installer.lnk
rmdir /S /Q "%ProgramFiles%\Microsoft\Windows\Start Menu\Programs\Software-Installer"
rmdir /S /Q "%appdata%\Microsoft\Windows\Start Menu\Programs\Software-Installer"
CLS
echo.
echo  Finished! Scripts were deleted!
echo  Accidentally removed? https://github.com/SanCraftDev/Software-Installer/releases/latest
Pause
rmdir /S /Q "%ProgramFiles%\Software-Installer"
rmdir /S /Q "%appdata%\Software-Installer"
del /S /Q %0
GOTO end

:restart
start %ComSpec% /C %0
EXIT /B
