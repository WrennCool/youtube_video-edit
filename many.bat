
@echo off

set url= ''
set mkvname= ''

setlocal enabledelayedexpansion

for /f  %%i in (urls.txt)  do one "%%i"
pause