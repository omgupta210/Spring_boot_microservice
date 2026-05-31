@echo off
set ROOT=%~dp0
cd /d "%ROOT%"

echo Building...
call mvn clean install -DskipTests
if errorlevel 1 exit /b 1

echo.
echo Starting Config Server on port 8090...
start "Config Server" cmd /k "cd /d %ROOT%config-server && mvn spring-boot:run"
timeout /t 8 /nobreak > nul

echo Starting Hello App on port 8091...
start "Hello App" cmd /k "cd /d %ROOT%hello-app && mvn spring-boot:run"

echo.
echo Open: http://localhost:8091/
echo Config: http://localhost:8090/hello-app/default
