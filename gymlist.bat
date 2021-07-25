@echo off

set file_path=%userprofile%\dropbox\lists\gym
if not exist %file_path% mkdir %file_path%

for /f %%i in ('getdate.bat') do set today=%%i

rem open in dropbox neovim
nvim %file_path%/%today%.txt
