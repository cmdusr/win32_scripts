@echo off

rem Check for cl.exe
call where.exe /q cl.exe

rem Did we find it?
if %ERRORLEVEL% EQU 0 exit /b 0

rem Reset ERRORLEVEL
type nul > nul

rem Search for visual studio vcvarsall.bat
rem Use x64 version of visual studio 2022 or later. Fall back on x86 version
if exist "c:\program files\microsoft visual studio" (
	for /f "delims=" %%a in ('dir /b /s "c:\program files\microsoft visual studio\vcvarsall.bat"') do set name="%%a"
) else if exist "c:\program files (x86)\microsoft visual studio" (
	for /f "delims=" %%a in ('dir /b /s "c:\program files (x86)\microsoft visual studio\vcvarsall.bat"') do set name="%%a"
) else (
	set ERRORLEVEL=1
)

if %ERRORLEVEL% NEQ 0 (
	echo Failed to find vcvarsall.bat
	echo Requires Microsoft C++ tools to setup development environment
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
