@echo off
REM Serviço de Limpeza de Arquivos Temporários
echo Limpando arquivos temporários...
del /s /q %temp%\*
echo Limpeza concluída!

pause