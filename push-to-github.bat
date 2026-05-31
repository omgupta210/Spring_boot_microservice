@echo off
setlocal
set ROOT=%~dp0
set GIT=C:\Program Files\Git\cmd\git.exe
set GH=C:\Program Files\GitHub CLI\gh.exe
set REPO=config_server_code
set OWNER=omgupta210

cd /d "%ROOT%"

echo === Deploy %REPO% to GitHub ===
echo.

"%GH%" auth status >nul 2>&1
if errorlevel 1 (
    echo Step 1: Login to GitHub (browser will open)...
    "%GH%" auth login -h github.com -p https -w
    if errorlevel 1 (
        echo Login failed. Run manually: gh auth login
        exit /b 1
    )
)

echo.
echo Step 2: Create repo and push...
"%GH%" repo create %OWNER%/%REPO% --public --description "Spring Boot Config Server + Hello World app" --source=. --remote=origin --push

if errorlevel 1 (
    echo.
    echo Repo may already exist. Trying push only...
    "%GIT%" remote remove origin 2>nul
    "%GIT%" remote add origin https://github.com/%OWNER%/%REPO%.git
    "%GIT%" push -u origin main
)

if errorlevel 1 (
    echo Deploy failed.
    exit /b 1
)

echo.
echo SUCCESS: https://github.com/%OWNER%/%REPO%
