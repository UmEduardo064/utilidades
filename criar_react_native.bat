@echo off
setlocal

title Criador de Projeto React Native

set "BASE_DIR=C:\Users\025747\Desktop"

echo ==========================================
echo       CRIADOR DE PROJETO REACT NATIVE
echo ==========================================
echo.
echo Local base: %BASE_DIR%
echo.

if not exist "%BASE_DIR%" (
    echo ERRO: A pasta %BASE_DIR% nao existe.
    pause
    exit /b 1
)

set /p PROJECT_NAME=Digite o nome do projeto: 

if "%PROJECT_NAME%"=="" (
    echo.
    echo ERRO: O nome do projeto nao pode estar vazio.
    pause
    exit /b 1
)

echo.
echo Criando o projeto em:
echo %BASE_DIR%\%PROJECT_NAME%
echo.

cd /d "%BASE_DIR%"

npx @react-native-community/cli@latest init "%PROJECT_NAME%"

if errorlevel 1 (
    echo.
    echo ==========================================
    echo ERRO ao criar o projeto.
    echo ==========================================
    pause
    exit /b 1
)

cd /d "%BASE_DIR%\%PROJECT_NAME%"

echo.
echo ==========================================
echo Instalando dependencias...
echo ==========================================
echo.

call npm install

if errorlevel 1 (
    echo.
    echo ERRO ao instalar as dependencias.
    pause
    exit /b 1
)

echo.
echo ==========================================
echo PROJETO CRIADO COM SUCESSO!
echo ==========================================
echo.
echo Local:
echo %BASE_DIR%\%PROJECT_NAME%
echo.
echo Para iniciar o Metro:
echo npm start
echo.
echo Para executar no Android:
echo npx react-native run-android
echo.

pause