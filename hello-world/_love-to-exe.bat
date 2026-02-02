@echo off
setlocal
set LOVE_NAME=main.love
set EXE_NAME=main.exe

if not exist %LOVE_NAME% exit /b

if exist %EXE_NAME% del %EXE_NAME%

copy /b "C:\Program Files\LOVE\love.exe"+%LOVE_NAME% %EXE_NAME%
