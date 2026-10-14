@echo off
setlocal
cd /d "%~dp0"
if exist "%~dp0duel_stages.exe" set "DUEL_STAGE_EXE=%~dp0duel_stages.exe"
if not defined PYTHON_EXE set "PYTHON_EXE=py -3"
where py >nul 2>nul
if errorlevel 1 set "PYTHON_EXE=python"
set "STAGE=%~1"
if not defined STAGE (
    choice /c 012345 /n /m "Select stage [0/1/2/3/4/5]: "
    if errorlevel 6 (set "STAGE=5") else if errorlevel 5 (set "STAGE=4") else if errorlevel 4 (set "STAGE=3") else if errorlevel 3 (set "STAGE=2") else if errorlevel 2 (set "STAGE=1") else if errorlevel 1 (set "STAGE=0") else exit /b 1
)
if "%STAGE%"=="0" goto run
if "%STAGE%"=="1" goto run
if "%STAGE%"=="2" goto run
if "%STAGE%"=="3" goto run
if "%STAGE%"=="4" goto run
if "%STAGE%"=="5" goto run
echo Usage: run_duel_stage.bat [0^|1^|2^|3^|4^|5]
exit /b 1
:run
if defined DUEL_STAGE_EXE (
    "%DUEL_STAGE_EXE%" %STAGE%
) else (
    %PYTHON_EXE% "%~dp0duel_stages.py" %STAGE%
)
set "RESULT=%ERRORLEVEL%"
pause
exit /b %RESULT%
