@echo off
:start
curl -L -o %0 https://raw.githubusercontent.com/SanCraft-io/Software-Installer/main/Installer.bat
FOR /F "usebackq" %%f IN (`PowerShell -NoProfile -Command "Write-Host([Environment]::GetFolderPath('Desktop'))"`) DO (
  SET "DESKTOP_FOLDER=%%f"
  )
del /S /Q "%TMP%\Programm.msi"
del /S /Q "%TMP%\Programm.exe"
del /S /Q "%TMP%\Programm.bat"

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
mkdir "%appdata%\Software-Installer"
mkdir "%appdata%\Microsoft\Windows\Start Menu\Programs\Software-Installer"
cd "%appdata%\Software-Installer"
curl -L -o Software-Installer.bat https://raw.githubusercontent.com/SanCraft-io/Software-Installer/main/Software-Installer.bat
curl -L -o Installer-Uninstaller.bat https://raw.githubusercontent.com/SanCraft-io/Software-Installer/main/Installer.bat
curl -L -o Download.ico https://raw.githubusercontent.com/SanCraft-io/Software-Installer/main/Download.ico
curl -L -o Installer.ico https://raw.githubusercontent.com/SanCraft-io/Software-Installer/main/Installer.ico

set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo  Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo  sLinkFile = "%appdata%\Microsoft\Windows\Start Menu\Programs\Software-Installer\Software-Installer.lnk" >> %SCRIPT%
echo  Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo  oLink.TargetPath = "%windir%\system32\cmd.exe" >> %SCRIPT%
echo  oLink.Arguments = "/C %appdata%\Software-Installer\Software-Installer.bat" >> %SCRIPT%
echo  oLink.IconLocation = "%appdata%\Software-Installer\Download.ico" >> %SCRIPT%
echo  oLink.Save >> %SCRIPT%
cscript /nologo %SCRIPT%
del /S /Q %SCRIPT%

set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo  Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo  sLinkFile = "%appdata%\Microsoft\Windows\Start Menu\Programs\Software-Installer\Installer-Uninstaller.lnk" >> %SCRIPT%
echo  Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo  oLink.TargetPath = "%windir%\system32\cmd.exe" >> %SCRIPT%
echo  oLink.Arguments = "/C %appdata%\Software-Installer\Installer-Uninstaller.bat" >> %SCRIPT%
echo  oLink.IconLocation = "%appdata%\Software-Installer\Installer.ico" >> %SCRIPT%
echo  oLink.Save >> %SCRIPT%
cscript /nologo %SCRIPT%
del /S /Q %SCRIPT%

CLS
echo  Scripts were saved in "%appdata%\Software-Installer"!
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
echo  oLink.Arguments = "/C %appdata%\Software-Installer\Software-Installer.bat" >> %SCRIPT%
echo  oLink.IconLocation = "%appdata%\Software-Installer\Download.ico" >> %SCRIPT%
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
rmdir /S /Q "%appdata%\Microsoft\Windows\Start Menu\Programs\Software-Installer"
CLS
echo.
echo  Finished! Scripts were deleted!
echo  Accidentally removed? https://github.com/2020Sanoj/Software-Installer/releases/latest
Pause
rmdir /S /Q %appdata%\Software-Installer"
del /S /Q %0
GOTO end

:restart
start %ComSpec% /C %0
EXIT /B