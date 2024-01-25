@echo off
cls
color 3
mode 125 , 15                                                                                                     
taskkill /F /im wscript.exe
set user=%userprofile%\documents
cd \
cd %user%
if not exist tpm mkdir tpm
cd tpm
set c=Male
set /A val=0
set /A vol=100
set /A speed=2
cls
:r
title Batch TTS 
cls
echo d8888b.  .d8b.  d888888b  .o88b. db   db      d888888b d888888b .d8888. 
echo 88  `8D d8' `8b `~~88~~' d8P  Y8 88   88      `~~88~~' `~~88~~' 88'  YP 
echo 88oooY' 88ooo88    88    8P      88ooo88         88       88    `8bo.   
echo 88~~~b. 88~~~88    88    8b      88~~~88         88       88      `Y8b. 
echo 88   8D 88   88    88    Y8b  d8 88   88         88       88    db   8D 
echo Y8888P' YP   YP    YP     `Y88P' YP   YP         YP       YP    `8888Y' 
echo    d8888b. db    db      d88D db       .d88b.  d8b   db  d888b  C88D    
echo    88  `8D `8b  d8'      88   88      .8P  Y8. 888o  88 88' Y8b   88    
echo    88oooY'  `8bd8'       88   88      88    88 88V8o 88 88        88     
echo    88~~~b.    88         88   88      88    88 88 V8o88 88  ooo   88     
echo    88   8D    88         88   88booo. `8b  d8' 88  V888 88. ~8~   88  
echo    Y8888P'    YP         L88D Y88888P  `Y88P'  VP   V8P  Y888P  C888 
set /p r="Read from file (R) OR Read from typed text (T): "
if "%r%"=="R" goto fileread
if "%r%"=="T" goto S
if not "%r%"=="T" goto r
if not "%r%"=="R" goto r


:S
title Text To Speech
cls
echo d888888b d88888b db    db d888888b   d888888b  .d88b.    .d8888. d8888b. d88888b d88888b  .o88b. db   db    
echo `~~88~~' 88'     `8b  d8' `~~88~~'   `~~88~~' .8P  Y8.   88'  YP 88  `8D 88'     88'     d8P  Y8 88   88    
echo    88    88ooooo  `8bd8'     88         88    88    88   `8bo.   88oodD' 88ooooo 88ooooo 8P      88ooo88    
echo    88    88~~~~~  .dPYb.     88         88    88    88     `Y8b. 88~~~   88~~~~~ 88~~~~~ 8b      88~~~88    
echo    88    88.     .8P  Y8.    88         88    `8b  d8'   db   8D 88      88.     88.     Y8b  d8 88   88  db 
echo    YP    Y88888P YP    YP    YP         YP     `Y88P'    `8888Y' 88      Y88888P Y88888P  `Y88P' YP   YP  VP  By [LONG]
echo Type: .BACK to return or: .HELP for commands
echo Current Voice = %c%
echo Speed = %speed%
echo Volume = %vol%
set /p prompt="what would you like me to say?: " 
echo %prompt% >> log.LOG
echo %val% >> log
echo %vol% >> log
echo %speed% >> log
if "%prompt%"==".EXIT" goto E 
if "%prompt%"==".VOICE_M" goto cv1
if "%prompt%"==".VOICE_F" goto cv2
if "%prompt%"==".VOL" goto volu
if "%prompt%"==".SPEED" goto speed
if "%prompt%"==".HELP" goto help
if "%prompt%"==".SHOW_LOG" goto log
if "%prompt%"==".VBSDEBUG" goto debug
if "%prompt%"==".NUMLOG" goto numlog
if "%prompt%"==".BACK" goto r
if "%prompt%"==".COLOR" goto colorc
echo Dim s > temp.vbs
echo Set s = createObject("SAPI.spVoice") >> temp.vbs
echo Set s.Voice = s.GetVoices.item(%val%) >> temp.vbs
echo s.Rate = %speed% >> temp.vbs
echo s.Volume = %vol% >> temp.vbs
echo s.Speak "%prompt%" >> temp.vbs
echo Dim s >> VBSdebug.DBG
echo set s = createObject("SAPI.spVoice") >> VBSdebug.DBG
echo set s.voice = s.GetVoices.item(%val%) >> VBSdebug.DBG
echo s.Rate = %speed% >> VBSdebug.DBG
echo s.Volume = %vol% >> VBSdebug.DBG
echo s.speak "%prompt%" >> VBSdebug.DBG
start temp.vbs
timeout 2 
goto S
:cv1
set /A val=0 
set c=Male
goto S
:cv2
set /A val=1 
set c=Female
goto S
:volu
set /p vol="Enter a number Between 1 and 100(Default=100): "  
goto S
:speed
set /p speed="Enter a number Between 1 and 10(Default=2): "  
goto S
:log
type log.LOG
pause
goto S
:debug
type VBSdebug.DBG
pause
goto S
:numlog
type log
pause
goto S
:colorc
goto s
:help
echo Commands: .EXIT > To close window : .READ_FILE > Reads text from a text file : .VOICE_(M or F Defaut M) : .SPEED(val between 1-9 Default 2) : .VOL(val between 1-100 Default 100) : .SHOW_LOG > Shows last typed message : .VBSDEBUG : .NUMLOG
pause
goto S
:fileread
title Read From File
cls
cls
echo d8888b. d88888b  .d8b.  d8888b.      d88888b d8888b.  .d88b.  .88b  d88.      d88888b d888888b db      d88888b 
echo 88  `8D 88'     d8' `8b 88  `8D      88'     88  `8D .8P  Y8. 88'YbdP`88      88'       `88'   88      88'     
echo 88oobY' 88ooooo 88ooo88 88   88      88ooo   88oobY' 88    88 88  88  88      88ooo      88    88      88ooooo 
echo 88`8b   88~~~~~ 88~~~88 88   88      88~~~   88`8b   88    88 88  88  88      88~~~      88    88      88~~~~~ 
echo 88 `88. 88.     88   88 88  .8D      88      88 `88. `8b  d8' 88  88  88      88        .88.   88booo. 88.     
echo 88   YD Y88888P YP   YP Y8888D'      YP      88   YD  `Y88P'  YP  YP  YP      YP      Y888888P Y88888P Y88888P  BY [LONG]
echo Type: .BACK to return or: .HELP for command The Char limit is 8191 The chars "&%#@()^{}[]/\;""" will crash the program.
echo Current Voice = %c%
echo Speed = %speed%
echo Volume = %vol%
set /p path="Input File Path or .OPEN to use GUI: " 
if "%path%"==".EXIT" goto E 
if "%path%"==".VOICE_M" goto cv11
if "%path%"==".VOICE_F" goto cv21
if "%path%"==".VOL" goto volu1
if "%path%"==".SPEED" goto speed1
if "%path%"==".HELP" goto help1
if "%path%"==".SHOW_LOG" goto log1
if "%path%"==".VBSDEBUG" goto debug1
if "%path%"==".NUMLOG" goto numlog1
if "%path%"==".BACK" goto r
if "%path%"==".OPEN" goto fileselect
if not exist %path% goto error
:rr
SETLOCAL EnableDelayedExpansion
for /f "Tokens=* Delims=" %%x in (%path%) do set "read=!read!%%x"
echo Dim s > tempr.vbs
echo Set s = createObject("SAPI.spVoice") >> tempr.vbs
echo Set s.Voice = s.GetVoices.item(%val%) >> tempr.vbs
echo s.Rate = %speed% >> tempr.vbs
echo s.Volume = %vol% >> tempr.vbs
echo s.Speak "%read%" >> tempr.vbs
start tempr.vbs
timeout 2
ENDLOCAL
goto fileread
:cv11
set /A val=0 
set c=Male
goto fileread
:cv21
set /A val=1 
set c=Female
goto fileread
:volu1
set /p vol="Enter a number Between 1 and 100(Default=100): "  
goto fileread
:speed1
set /p speed="Enter a number Between 1 and 10(Default=2): "  
goto fileread
:log1
type log.LOG
pause
goto fileread
:debug1
type VBSdebug.DBG
pause
goto fileread
:numlog1
type log
pause
goto fileread
:Help1
echo Commands: .EXIT to close : .VOICE_(M or F Defaut M) : .SPEED(val between 1-9 Default 2) : .VOL(val between 1-100 Default 100) : .SHOW_LOG : .VBSDEBUG : .NUMLOG
pause
goto fileread
:fileselect
set dialog="about:<input type=file id=FILE><script>FILE.click();new ActiveXObject
set dialog=%dialog%('Scripting.FileSystemObject').GetStandardStream(1).WriteLine(FILE.value);
set dialog=%dialog%close();resizeTo(0,0);</script>"
for /f "tokens=* delims=" %%p in ('C:\Windows\System32\mshta.exe %dialog%') do set "path=%%p"
set %1=%path%
goto rr
:error
echo x=msgbox("Could Not Find File: %path%" ,0, "Error!!") > erro.vbs
timeout 1
start erro.vbs
goto fileread 
:E
echo %val% > val.set
cls
taskkill /F /im wscript.exe
del temp.vbs
del tempr.vbs
del erro.vbs
exit
