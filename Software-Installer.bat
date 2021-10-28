:: curl -L -o Programm. https://dl.san0j.de/software/
:: start "" ms-windows-store://pdp/?ProductId=
@echo  off
:start
curl -L -o %0 https://raw.githubusercontent.com/SanCraft-io/Software-Installer/main/Software-Installer.bat
del /S /Q "%TMP%\Programm.msi"
del /S /Q "%TMP%\Programm.exe"
del /S /Q "%TMP%\Programm.bat"
CLS
echo.
echo  Welcome!
echo  1. Browser/E-Mail/Office
echo  2. Tools (Normale Nutzer)
echo  3. Spiele
echo  4. Social Media/Messenger/Entertaiment
echo  5. Tools (Richtung Programmierung)
echo  6. Programmierung
echo  7. Aufnahme Tools/Kreatives
echo  8. Restart
echo  9. End
echo.
CHOICE /C 123456789 /M " Selection: "
IF ERRORLEVEL 9 GOTO end
IF ERRORLEVEL 8 GOTO restart
IF ERRORLEVEL 7 GOTO rc
IF ERRORLEVEL 6 GOTO pm
IF ERRORLEVEL 5 GOTO tp
IF ERRORLEVEL 4 GOTO sm
IF ERRORLEVEL 3 GOTO sg
IF ERRORLEVEL 2 GOTO tl
IF ERRORLEVEL 1 GOTO of

:of
echo  A) Firefox
echo  B) Chrome
echo  C) Opera
echo  D) Opera GX
echo  E) Thunderbird
CHOICE /C ABCDEFGHIJKLMNOPQRSTUVWXYZ /M " Selection: "

IF ERRORLEVEL 5 winget install thunderbird
IF ERRORLEVEL 4 winget install opera.operagx
IF ERRORLEVEL 3 winget install opera.opera
IF ERRORLEVEL 2 winget install chrome
IF ERRORLEVEL 1 winget install firefox
GOTO f

:f
echo Finished!
echo  1. End
echo  2. Install more!
echo  3. Install more from the same Categorie!
CHOICE /C 123 /M " Selection: "


:restart
start %ComSpec% /C %0
EXIT /B

:end
EXIT /B