@echo off
title The Quotidian Vault - Emergency Uninstaller
color 0c
echo ===================================================
echo     The Quotidian Vault - Emergency Uninstaller
echo ===================================================
echo.
echo This tool will forcefully close the app and remove all
echo corrupted installation files.
echo.
pause

echo Killing processes...
taskkill /F /IM "The Quotidian Vault.exe" /T >nul 2>&1
taskkill /F /IM 7za.exe /T >nul 2>&1
taskkill /F /IM "The Quotidian Vault Setup 1.0.0.exe" /T >nul 2>&1
taskkill /F /IM "Uninstall The Quotidian Vault.exe" /T >nul 2>&1

echo Removing files...
rmdir /S /Q "%USERPROFILE%\AppData\Local\Programs\the-quotidian-vault" >nul 2>&1
rmdir /S /Q "%USERPROFILE%\Documents\The Quotidian Vault" >nul 2>&1

echo Cleaning Registry...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Uninstall\8884f386-8c4d-524a-a293-c6cad384a648" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Uninstall\com.mozzerellacompany.quotidianvault" /f >nul 2>&1

echo.
echo Cleanup complete! You can now safely reinstall the application.
echo This script will now delete itself...
ping 127.0.0.1 -n 4 >nul
(goto) 2>nul & del "%~f0"
