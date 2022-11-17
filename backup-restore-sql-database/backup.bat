@echo off
cls
color 0a
title Parking Bucket Backup database
pushd "E:"
echo -- BACKUP DATABASE --
set DATABASENAME=parkingbucket-dev

:: db.bak
set DATESTAMP=%DATE:~-4%.%DATE:~7,2%.%DATE:~4,2%
set BACKUPFILENAME=%CD%\%DATABASENAME%-%DATESTAMP%.bak
set SERVERNAME=DESKTOP-PRSPPN4
echo.

sqlcmd -E -S %SERVERNAME% -d master -Q "BACKUP DATABASE [%DATABASENAME%] TO DISK = N'%BACKUPFILENAME%' WITH INIT , NOUNLOAD , NAME = N'%DATABASENAME% backup', NOSKIP , STATS = 10, NOFORMAT"

echo.
echo -- Backup successfull --
echo.
pause