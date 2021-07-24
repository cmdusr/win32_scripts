@echo off

rem Get todays date: yyyy-mm-dd
for /f "skip=1" %%x in ('wmic os get localdatetime') do if not defined MyDate set MyDate=%%x
for /f %%x in ('wmic path win32_localtime get /format:list ^| findstr "="') do set %%x
set fmonth=00%Month%
set fday=00%Day%
set today=%Year%-%fmonth:~-2%-%fday:~-2%

rem open in dropbox neovim
nvim %userprofile%/dropbox/lists/day/%today%
