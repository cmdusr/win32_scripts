@echo off

rem Check for cl.exe
call where.exe /q cl.exe

rem Did we find it?
if %ERRORLEVEL% EQU 0 exit /b 0

rem Reset ERRORLEVEL
type nul > nul

rem Find vcvarsall.bat
for /f "delims=" %%a in ('dir /b /s "c:\program files (x86)\microsoft visual studio\vcvarsall.bat"') do set name="%%a"
if %ERRORLEVEL% NEQ 0 (
	echo Error: Failed to find cl.exe
	echo Failed to find vcvarsall.bat to setup devlopment environment
	echo Requires Microsoft C++ tools
	exit /b 1
)

rem Run vcvarsall.bat
call %name% x64
if %ERRORLEVEL% NEQ 0 (
	echo Error: Failed to run vcvarsall.bat
	exit /b 1
)

rem Success
exit /b 0
