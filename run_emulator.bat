@echo off
title Android Emulator Launcher
echo ===================================================
echo   Dang khoi dong may ao
echo ===================================================

echo [1/3] Don dep tien trinh cu va file lock...
taskkill /F /IM qemu-system-x86_64.exe >nul 2>&1
taskkill /F /IM emulator.exe >nul 2>&1

if exist "%USERPROFILE%\.android\avd\LowSpec_Android_11.avd\*.lock" (
    rmdir /S /Q "%USERPROFILE%\.android\avd\LowSpec_Android_11.avd\hardware-qemu.ini.lock" >nul 2>&1
    del /F /Q "%USERPROFILE%\.android\avd\LowSpec_Android_11.avd\multiinstance.lock" >nul 2>&1
)

echo [2/3] Chuyen thu muc lam viec den Android Emulator SDK...
cd /d "%LOCALAPPDATA%\Android\Sdk\emulator"

echo [3/3] Dang mo may ao len man hinh...
start "" emulator.exe -avd LowSpec_Android_11 -no-boot-anim -no-audio -scale 0.75 -netdelay none -netspeed full

echo.
echo ===================================================
echo   May ao dang duoc khoi dong tren Desktop!
echo ===================================================
ping 127.0.0.1 -n 3 >nul
