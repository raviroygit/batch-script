@echo off
cls
color 0a
title Parking Bucket restore database

echo -- RESTORE DATABASE --

set BACKUPFILENAME=parkingbucket-dev-2022.17.11.bak
set DATABASENAME=parkingbucket-dev
set SERVERNAME=DESKTOP-PRSPPN4
sqlcmd -E -S %SERVERNAME% -d master -Q "ALTER DATABASE [%DATABASENAME%] SET SINGLE_USER WITH ROLLBACK IMMEDIATE"

:: WARNING - delete the database, suits me
:: sqlcmd -E -S %SERVERNAME% -d master -Q "IF EXISTS (SELECT * FROM sysdatabases WHERE name=N'%DATABASENAME%' ) DROP DATABASE [%DATABASENAME%]"
:: sqlcmd -E -S %SERVERNAME% -d master -Q "CREATE DATABASE [%DATABASENAME%]"


:: restore
echo.
sqlcmd -E -S %SERVERNAME% -d master -Q "RESTORE DATABASE [%DATABASENAME%] FROM DISK = N'%CD%\%BACKUPFILENAME%' WITH REPLACE"


echo.
