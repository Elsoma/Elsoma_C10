@echo off
cls
echo ====================
echo ELSOMA
echo C10 Firmware Updater 
echo SW Version 2.4p
echo ====================
echo . 
pause

if "%1"=="" goto NOPAR
if "%1"=="/?" goto HELP
if "%1"=="/help" goto HELP

:FLASHEN
mode %1:1200,n,8,1,p
if %ERRORLEVEL% neq 0 goto COMERR
echo .
echo C10 Reset
echo Bitte warten, bis der Update-Prozess erfolgreich beendet wurde!
echo .
bossac.exe -i --port=%1 -U false -e -w -v -b C1010A16_Flussdichtemessgeraet_2_4p.bin -R
if %ERRORLEVEL% neq 0 goto PROGERR
echo =====================
echo flashen wurde erfolgreich beendet
goto DONE

:COMERR
echo .
echo An diesem COM-Port wurde kein C10 Flussdichtemessgeraet gefunden!
echo bitte C10 mit dem USB-Port verbinden und im Geraetemanager 
echo unter "Anschluesse (COM & LPT)"
echo nachschauen, welche Port-Nummer zugewiesen wurde!
echoe .
goto DONE

:NOPAR
echo .
echo kein COM port angegeben
echo .
echo Anwendungsbeispiel:
echo C10_FlashFirmware.bat COM23
echo ----------------------------
goto DONE

:HELP
echo .
echo usage: C10_FlashFirmware.bat COMx
echo x = {1,2,3,....}
echo die korrekte Nummer ist im Geraetemanager nachzuschlagen
echo .
goto DONE

:DONE
pause
