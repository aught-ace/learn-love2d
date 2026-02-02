@echo off
setlocal
set LOVE_NAME=main.love

if exist %LOVE_NAME% del %LOVE_NAME%

powershell -command "Compress-Archive -Path (Get-ChildItem -Exclude '*.bat', '*.love', '*.exe') -DestinationPath .\main.zip" > nul

ren main.zip %LOVE_NAME%
