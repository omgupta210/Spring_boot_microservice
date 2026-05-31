@echo off
set ROOT=%~dp0
cd /d "%ROOT%"

where git >nul 2>&1
if errorlevel 1 (
    echo Git is not installed.
    echo Install from: https://git-scm.com/download/win
    echo Then run this script again.
    exit /b 1
)

echo Initializing git repository...
if not exist ".git" git init

git add .
git status

echo.
set /p MSG="Commit message [Initial commit: Hello World + Config Server]: "
if "%MSG%"=="" set MSG=Initial commit: Hello World + Config Server

git commit -m "%MSG%"
if errorlevel 1 (
    echo Nothing to commit or commit failed.
)

echo.
echo --- Push to GitHub (omgupta210) ---
echo 1. Create repo: https://github.com/new
echo    Name: spring-server-code
echo    Do NOT add README
echo.
echo 2. Default remote URL:
echo    https://github.com/omgupta210/spring-server-code.git
echo.
set /p PUSH=Do you want to add remote and push now? (y/n): 
if /i not "%PUSH%"=="y" exit /b 0

set REMOTE=https://github.com/omgupta210/spring-server-code.git
set /p CUSTOM=Press Enter to use default URL or paste a different repo URL: 
if not "%CUSTOM%"=="" set REMOTE=%CUSTOM%

git branch -M main
git remote remove origin 2>nul
git remote add origin %REMOTE%
git push -u origin main

if errorlevel 1 (
    echo Push failed. Make sure:
    echo - Git is installed and you are logged in
    echo - Repo exists at https://github.com/omgupta210/spring-server-code
) else (
    echo Done! https://github.com/omgupta210/spring-server-code
)
