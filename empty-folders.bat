@echo off
setlocal enabledelayedexpansion

echo This script will delete all files within the folders in this directory.
echo ---------------------------------------------------------
echo Listing files in each folder:
echo.

for /d %%i in (*) do (
    echo Files in folder %%i:
    pushd "%%i"
    for %%j in (*) do (
        echo %%j
    )
    popd
    echo.
)

echo ---------------------------------------------------------
set /p confirm=Are you sure you want to delete all files within the folders? (Y/N): 

if /i "%confirm%"=="Y" (
    for /d %%i in (*) do (
        echo Deleting files in folder: %%i
        del /q "%%i\*.*"
    )
    echo All files deleted.
) else (
    echo Operation cancelled. No files were deleted.
)

pause
