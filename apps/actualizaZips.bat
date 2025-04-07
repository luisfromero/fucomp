@echo off
setlocal enabledelayedexpansion

REM Ruta al directorio apps
set "APPS_DIR=d:\onedrive\proyectos\fucomp\apps"

REM Cambiar al directorio apps
pushd "%APPS_DIR%"

REM Recorrer todos los subdirectorios
for /d %%D in (*) do (
    echo Procesando %%D...

    REM Borrar el ZIP si ya existe
    if exist "%%D.zip" del "%%D.zip"

    REM Comprimir el contenido del subdirectorio (no la carpeta), en un ZIP con su nombre
    powershell -Command ^
        "Compress-Archive -Path '.\%%D\*' -DestinationPath '.\%%D.zip' -Force"
)


if exist "todas.zip" del "todas.zip"
powershell -Command ^
    "Compress-Archive -Path (Get-ChildItem -Filter '*.zip' | Where-Object { $_.Name -ne 'todas.zip' } | ForEach-Object { $_.FullName }) -DestinationPath 'todas.zip' -Force"

popd

echo.
echo Todos los ZIPs se han generado correctamente en la carpeta %APPS_DIR%.
pause
