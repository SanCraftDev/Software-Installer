@echo off
:start
curl -L -o %0 https://dl.san0j.de/software/Installer.bat
FOR /F "usebackq" %%f IN (`PowerShell -NoProfile -Command "Write-Host([Environment]::GetFolderPath('Desktop'))"`) DO (
  SET "DESKTOP_FOLDER=%%f"
  )
del "%userprofile%\AppData\Local\Temp\Programm.msi"
del "%userprofile%\AppData\Local\Temp\Programm.exe"
del "%userprofile%\AppData\Local\Temp\Programm.bat"

CLS
echo.
echo  Willkommen beim Installer des Software-Installers!
echo.
echo  1. Installieren/Reparieren
echo  2. Entfernen
echo.
CHOICE /C 12 /M " Auswahl: "
IF ERRORLEVEL 2 GOTO rm
IF ERRORLEVEL 1 GOTO is

:is
CLS
echo  Instalation starten?
Pause
mkdir "%ProgramFiles(x86)%\Software-Installer"
mkdir "%appdata%\Microsoft\Windows\Start Menu\Programs\Software-Installer"
cd "%ProgramFiles(x86)%\Software-Installer"
curl -L -o Software-Installer.bat https://dl.san0j.de/software/Mod-Installer.bat
curl -L -o Installer-Uninstaller.bat https://dl.san0j.de/software/Installer.bat
curl -L -o Donwload.ico https://dl.san0j.de/software/Download.ico
curl -L -o Installer.ico https://dl.san0j.de/software/Installer.ico

set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo  Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo  sLinkFile = "%appdata%\Microsoft\Windows\Start Menu\Programs\Software-Installer\Software-Installer.lnk" >> %SCRIPT%
echo  Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo  oLink.TargetPath = "%windir%\system32\cmd.exe" >> %SCRIPT%
echo  oLink.Arguments = "/C %ProgramFiles(x86)%\Software-Installer\Software-Installer.bat" >> %SCRIPT%
echo  oLink.IconLocation = "%ProgramFiles(x86)%\Software-Installer\Donwload.ico" >> %SCRIPT%
echo  oLink.Save >> %SCRIPT%
cscript /nologo %SCRIPT%
del /S /Q %SCRIPT%

set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo  Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo  sLinkFile = "%appdata%\Microsoft\Windows\Start Menu\Programs\Software-Installer\Installer-Uninstaller.lnk" >> %SCRIPT%
echo  Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo  oLink.TargetPath = "%windir%\system32\cmd.exe" >> %SCRIPT%
echo  oLink.Arguments = "/C %ProgramFiles(x86)%\Software-Installer\Installer-Uninstaller.bat" >> %SCRIPT%
echo  oLink.IconLocation = "%ProgramFiles(x86)%\Software-Installer\Installer.ico" >> %SCRIPT%
echo  oLink.Save >> %SCRIPT%
cscript /nologo %SCRIPT%
del /S /Q %SCRIPT%

CLS
echo  Scripte erfolgreich in "%ProgramFiles(x86)%\Software-Installer" gespeichert!
echo  Desktopverkpfung erstellen?
echo.
echo  1. Ja
echo  2. Nein
echo.
CHOICE /C 12 /M " Auswahl: "
IF ERRORLEVEL 2 GOTO if
IF ERRORLEVEL 1 GOTO l

:l
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo  Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo  sLinkFile = "%DESKTOP_FOLDER%\Software-Installer.lnk" >> %SCRIPT%
echo  Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo  oLink.TargetPath = "%windir%\system32\cmd.exe" >> %SCRIPT%
echo  oLink.Arguments = "/C %ProgramFiles(x86)%\Software-Installer\Mod-Installer.bat" >> %SCRIPT%
echo  oLink.IconLocation = "%ProgramFiles(x86)%\Software-Installer\Donwload.ico" >> %SCRIPT%
echo  oLink.Save >> %SCRIPT%
cscript /nologo %SCRIPT%
del /S /Q %SCRIPT%
GOTO if

:if
CLS
echo  Fertig
Pause
GOTO end

:end
exit /B

:rm
CLS
echo.
echo  Wirklich l”schen?
echo.
echo  1. Ja
echo  2. Nein
echo.
CHOICE /C 12 /M " Auswahl: "
IF ERRORLEVEL 2 GOTO end
IF ERRORLEVEL 1 GOTO rmy

:rmy
CLS
del /S /Q %ProgramFiles(x86)%\Software-Installer\Donwload.ico
del /S /Q %ProgramFiles(x86)%\Software-Installer\Installer.ico
del /S /Q %ProgramFiles(x86)%\Software-Installer\Mod-Installer.bat
del /S /Q %DESKTOP_FOLDER%\Software-Installer.lnk
rmdir /S /Q "%appdata%\Microsoft\Windows\Start Menu\Programs\Software-Installer"
CLS
echo.
echo  Fertig! Scripte wurden gel”scht!
echo  Ausversehen entfernt? https://github.com/2020Sanoj/Software-Installer/releases/latest
Pause
del /S /Q %ProgramFiles(x86)%\Software-Installer\Installer-Uninstaller.bat
del /S /Q %0
GOTO end

:restart
start %ComSpec% /C %0
EXIT /B