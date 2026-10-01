@echo off
setlocal

title Criador de Projeto React Native

echo ==========================================
echo       CRIADOR DE PROJETO REACT NATIVE
echo ==========================================
echo.

set /p PROJECT_NAME=Digite o nome do projeto: 

if "%PROJECT_NAME%"=="" (
    echo.
    echo ERRO: O nome do projeto nao pode estar vazio.
    pause
    exit /b 1
)

echo.
echo Criando o projeto "%PROJECT_NAME%"...
echo.

npx @react-native-community/cli@latest init "%PROJECT_NAME%"

if errorlevel 1 (
    echo.
    echo ==========================================
    echo ERRO ao criar o projeto.
    echo ==========================================
    pause
    exit /b 1
)

echo.
echo ==========================================
echo Projeto criado com sucesso!
echo ==========================================
echo.

cd /d "%PROJECT_NAME%"

echo Instalando dependencias...
call npm install

if errorlevel 1 (
    echo.
    echo ERRO ao instalar as dependencias.
    pause
    exit /b 1
)

echo.
echo ==========================================
echo Projeto pronto!
echo ==========================================
echo.
echo Pasta: %CD%
echo.
echo Para executar no Android:
echo     npx react-native run-android
echo.
echo Para iniciar o Metro:
echo     npm start
echo.

pause
