@echo off
setlocal

set "BACKUP_DIR=%~dp0vscode-backup"
set "EXT_FILE=%BACKUP_DIR%\extensions-list.txt"
set "SETTINGS_FILE=%BACKUP_DIR%\settings.json"
set "KEYBIND_FILE=%BACKUP_DIR%\keybindings.json"
set "VSCODE_USER_DIR=%APPDATA%\Code\User"

echo [1/3] Kengaytmalar o'rnatilmoqda...
if exist "%EXT_FILE%" (
    for /f %%e in (%EXT_FILE%) do (
        echo Installing: %%e
        code --install-extension %%e
    )
    echo ✔ Kengaytmalar o‘rnatildi.
) else (
    echo ⚠ extensions-list.txt topilmadi!
)

echo [2/3] Sozlamalar tiklanmoqda...
if exist "%SETTINGS_FILE%" (
    copy /Y "%SETTINGS_FILE%" "%VSCODE_USER_DIR%\settings.json" >nul
)
if exist "%KEYBIND_FILE%" (
    copy /Y "%KEYBIND_FILE%" "%VSCODE_USER_DIR%\keybindings.json" >nul
)
echo ✔ Sozlamalar tiklandi.

echo [3/3] Tizim tayyor! VS Code’ni qayta ishga tushiring.

pause
