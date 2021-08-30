::curl -L -o Programm. https://dl.san0j.de/software/
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
echo  C) Edge
echo  D) Opera
echo  E) Thunderbird
echo  F) Chrome Dev
echo  G) Edge Dev
echo  H) Opera Dev
CHOICE /C ABCDEFGHIJKLMNOPQRSTUVWXYZ /M " Auswahl: "

IF ERRORLEVEL 9 curl -L -o "%TMP%\Programm.exe" https://net.geo.opera.com/opera/beta/windows && start "%TMP%\Programm.exe"
IF ERRORLEVEL 8 curl -L -o "%TMP%\Programm.exe" https://c2rsetup.edog.officeapps.live.com/c2r/downloadEdge.aspx?platform=Default&source=EdgeInsiderPage&Channel=Beta&language=de && start "%TMP%\Programm.exe"
IF ERRORLEVEL 7 curl -L -o "%TMP%\Programm.exe" https://dl.san0j.de/chrome-beta && start "%TMP%\Programm.exe"
IF ERRORLEVEL 5 curl -L -o "%TMP%\Programm.exe" https://download.mozilla.org/?product=thunderbird-latest-ssl&os=win64&lang=de && start "%TMP%\Programm.exe"
IF ERRORLEVEL 4 curl -L -o "%TMP%\Programm.exe" https://net.geo.opera.com/opera/stable/windows && start "%TMP%\Programm.exe"
IF ERRORLEVEL 3 curl -L -o "%TMP%\Programm.exe" https://c2rsetup.officeapps.live.com/c2r/downloadEdge.aspx?platform=Default&source=EdgeStablePage&Channel=Stable&language=de && start "%TMP%\Programm.exe"
IF ERRORLEVEL 2 curl -L -o "%TMP%\Programm.exe" https://dl.san0j.de/chrome && start "%TMP%\Programm.exe"
IF ERRORLEVEL 1 curl -L -o "%TMP%\Programm.exe" https://download.mozilla.org/?product=firefox-latest-ssl&os=win64&lang=de && start "%TMP%\Programm.exe"
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