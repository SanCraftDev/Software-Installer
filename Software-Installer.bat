::curl -L -o Programm. --url https://download.san0j.de/software/
@echo off
:start
curl -L -o %0 --url https://download.san0j.de/software/Software-Installer.bat
del "%userprofile%\AppData\Local\Temp\Programm.msi"
del "%userprofile%\AppData\Local\Temp\Programm.exe"
del "%userprofile%\AppData\Local\Temp\Programm.bat"
CLS
echo.
echo Wilkommen!
echo 1. Browser/E-Mail/Office/E-Mail
echo 2. Tools (Normale Nutzer)
echo 3. Spiele
echo 4. Social Media/Messenger
echo 5. Tools (Richtung Programmierung)
echo 6. Programmierung
echo 7. Aufnahme Tools
echo 8. Kreatives
echo 9. Entertaiment