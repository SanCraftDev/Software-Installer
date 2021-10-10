::curl -L -o Programm. https://dl.san0j.de/software/
.. ms-windows-store://pdp/?ProductId=
@echo  off
:start
curl -L -o %0 https://dl.san0j.de/software/Software-Installer.bat
del /S /Q "%TMP%\Programm.msi"
del /S /Q "%TMP%\Programm.exe"
del /S /Q "%TMP%\Programm.bat"
CLS
echo.
echo  Wilkommen!
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
CHOICE /C 123456789 /M " Auswahl: "
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
CHOICE /C ABCDEFGHIJKLMNOPQRSTUVWXYZ /M " Auswahl: "

IF ERRORLEVEL 5 winget install thunderbird
IF ERRORLEVEL 4 winget install opera.operagx
IF ERRORLEVEL 3 winget install opera.opera
IF ERRORLEVEL 2 winget install chrome
IF ERRORLEVEL 1 winget install firefox
GOTO f

:f
echo Fertig!
echo  1. Beenden
echo  2. Mehr INstallieren
echo  3. Mehr aus gleicher Kategorie installieren
CHOICE /C 123 /M " Auswahl: "


:restart
start %ComSpec% /C %0
EXIT /B

:end
EXIT /B