@echo off
setlocal

:: Verifica se a URL foi fornecida
if "%~1"=="" (
    echo Por favor, forneça a URL do arquivo como argumento.
    echo Uso: jani-install URL
    exit /b 1
)

:: Obtém a URL fornecida pelo usuário
set "url=%~1"

:: Extrai o nome do arquivo da URL
for %%f in ("%url%") do set "filename=%%~nxf"

:: Define o caminho para a área de trabalho do usuário
set "desktop_dir=%USERPROFILE%\Desktop"

:: Define o caminho completo do arquivo
set "full_path=%desktop_dir%\%filename%"

:: Baixa o arquivo usando PowerShell
echo Baixando %filename% para a area de trabalho...
powershell -Command "Invoke-WebRequest -Uri '%url%' -OutFile '%full_path%'"

:: Verifica se o arquivo foi baixado com sucesso
if exist "%full_path%" (
    echo O arquivo %filename% foi baixado com sucesso para a area de trabalho.
) else (
    echo Falha ao baixar o arquivo.
    exit /b 1
)

endlocal