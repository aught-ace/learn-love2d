@echo off
setlocal
set LOVE_PATH=C:\Program Files\LOVE\love.exe
set LOVE_NAME=main.love
set EXE_NAME=main.exe

if not exist %LOVE_NAME% exit /b

if exist %EXE_NAME% del %EXE_NAME%

copy /b "%LOVE_PATH%"+%LOVE_NAME% %EXE_NAME%
