::curl -L -o Programm. https://dl.san0j.de/software/
@echo  off
:start
curl -L -o %0 https://dl.san0j.de/software/Software-Installer.bat
del "%userprofile%\AppData\Local\Temp\Programm.msi"
del "%userprofile%\AppData\Local\Temp\Programm.exe"
del "%userprofile%\AppData\Local\Temp\Programm.bat"
CLS
echo.
echo  Wilkommen!
echo  1. Browser/E-Mail/Office/E-Mail
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

:restart
start %0
EXIT /B

:end
EXIT /B