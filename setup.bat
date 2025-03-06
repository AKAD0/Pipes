@echo off
REM set current directory
set DIR=%~dp0
cd /d %DIR%

REM install libs
"python.exe" -m venv venv
call .\venv\Scripts\activate.bat
pip install numpy pandas matplotlib scikit-learn scipy

REM add .gitignore file
echo. > .gitignore
echo venv/ >> .gitignore

pause