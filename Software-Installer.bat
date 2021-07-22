::curl -L -o Programm. --url https://download.san0j.de/software/
@echo off
:start
curl -L --output %0 --url https://download.san0j.de/software/Software-Installer.bat
del "%userprofile%\AppData\Local\Temp\Programm.msi"
del "%userprofile%\AppData\Local\Temp\Programm.exe"
del "%userprofile%\AppData\Local\Temp\Programm.bat"
CLS
echo.
echo Wilkommen!