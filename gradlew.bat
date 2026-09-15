@ECHO OFF
SETLOCAL
SET APP_HOME=%~dp0
SET GRADLE_VERSION=9.6.0
IF "%GRADLE_USER_HOME%"=="" (
  SET CACHE_ROOT=%USERPROFILE%\.gradle\mnc-bf-distributions
) ELSE (
  SET CACHE_ROOT=%GRADLE_USER_HOME%\mnc-bf-distributions
)
SET GRADLE_HOME=%CACHE_ROOT%\gradle-%GRADLE_VERSION%
SET ZIP=%CACHE_ROOT%\gradle-%GRADLE_VERSION%-bin.zip

IF EXIST "%GRADLE_HOME%\bin\gradle.bat" GOTO run
IF NOT EXIST "%CACHE_ROOT%" MKDIR "%CACHE_ROOT%"
ECHO Installation locale de Gradle %GRADLE_VERSION%...
powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -UseBasicParsing 'https://services.gradle.org/distributions/gradle-%GRADLE_VERSION%-bin.zip' -OutFile '%ZIP%'; Expand-Archive -Path '%ZIP%' -DestinationPath '%CACHE_ROOT%' -Force"
IF ERRORLEVEL 1 EXIT /B 1

:run
CALL "%GRADLE_HOME%\bin\gradle.bat" -p "%APP_HOME%" %*
ENDLOCAL
