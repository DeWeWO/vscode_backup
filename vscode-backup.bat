@echo off
setlocal

REM Papka yaratish
set "BACKUP_DIR=%~dp0vscode-backup"
mkdir "%BACKUP_DIR%"

echo [1/3] Kengaytmalar ro'yxati olinmoqda...
code --list-extensions > "%BACKUP_DIR%\extensions-list.txt"
echo ✔ Kengaytmalar extensions-list.txt faylga yozildi.

echo [2/3] VS Code sozlamalari nusxalanmoqda...
set "VSCODE_USER_DIR=%APPDATA%\Code\User"
copy "%VSCODE_USER_DIR%\settings.json" "%BACKUP_DIR%\settings.json" >nul 2>&1
copy "%VSCODE_USER_DIR%\keybindings.json" "%BACKUP_DIR%\keybindings.json" >nul 2>&1
echo ✔ Sozlamalar settings.json va keybindings.json fayllari sifatida saqlandi.

echo [3/3] Saqlash jarayoni tugadi!
echo → Saqlangan fayllar: %BACKUP_DIR%

pause
