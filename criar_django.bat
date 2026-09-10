@echo off
title Criador de Projeto Django
color 0A

echo ==========================================
echo       CRIADOR DE PROJETO DJANGO
echo ==========================================
echo.

REM ==========================================
REM CONFIGURACAO
REM ==========================================

set "CAMINHO_BASE=C:\Users\025747\Desktop"

REM ==========================================
REM SELECIONAR NOME DO PROJETO
REM ==========================================

set /p PROJETO=Digite o nome do projeto: 

if "%PROJETO%"=="" (
    echo.
    echo ERRO: O nome do projeto nao pode estar vazio.
    pause
    exit /b
)

REM Caminho completo do projeto
set "CAMINHO_PROJETO=%CAMINHO_BASE%\%PROJETO%"

echo.
echo Projeto:
echo %PROJETO%
echo.
echo Local:
echo %CAMINHO_PROJETO%
echo.

REM ==========================================
REM VERIFICAR SE JA EXISTE
REM ==========================================

if exist "%CAMINHO_PROJETO%" (
    echo ==========================================
    echo ERRO: O projeto ja existe!
    echo ==========================================
    echo.
    echo Pasta:
    echo %CAMINHO_PROJETO%
    echo.
    echo Escolha outro nome ou remova a pasta existente.
    echo.
    pause
    exit /b
)

REM ==========================================
REM CRIAR PASTA
REM ==========================================

echo Criando pasta do projeto...

mkdir "%CAMINHO_PROJETO%"

if errorlevel 1 (
    echo.
    echo ERRO: Nao foi possivel criar a pasta.
    pause
    exit /b
)

cd /d "%CAMINHO_PROJETO%"

REM ==========================================
REM CRIAR AMBIENTE VIRTUAL
REM ==========================================

echo.
echo [1/7] Criando ambiente virtual...

python -m venv venv

if errorlevel 1 (
    echo.
    echo ERRO: Nao foi possivel criar a venv.
    echo.
    echo Verifique se o Python esta instalado e no PATH.
    pause
    exit /b
)

REM ==========================================
REM ATIVAR VENV
REM ==========================================

echo.
echo [2/7] Ativando ambiente virtual...

call venv\Scripts\activate.bat

if errorlevel 1 (
    echo.
    echo ERRO: Nao foi possivel ativar a venv.
    pause
    exit /b
)

REM ==========================================
REM ATUALIZAR PIP
REM ==========================================

echo.
echo [3/7] Atualizando o pip...

python -m pip install --upgrade pip

if errorlevel 1 (
    echo.
    echo ERRO: Nao foi possivel atualizar o pip.
    pause
    exit /b
)

REM ==========================================
REM INSTALAR DJANGO
REM ==========================================

echo.
echo [4/7] Instalando Django...

python -m pip install django

if errorlevel 1 (
    echo.
    echo ERRO: Nao foi possivel instalar o Django.
    pause
    exit /b
)

REM ==========================================
REM CRIAR PROJETO DJANGO
REM ==========================================

echo.
echo [5/7] Criando projeto Django...

django-admin startproject setup .

if errorlevel 1 (
    echo.
    echo ERRO: Nao foi possivel criar o projeto Django.
    pause
    exit /b
)

REM ==========================================
REM GERAR REQUIREMENTS.TXT
REM ==========================================

echo.
echo [6/7] Criando requirements.txt...

python -m pip freeze > requirements.txt

REM ==========================================
REM CRIAR .GITIGNORE
REM ==========================================

echo.
echo Criando .gitignore...

(
    echo # Ambiente virtual
    echo venv/
    echo.
    echo # Python
    echo __pycache__/
    echo *.py[cod]
    echo *.pyo
    echo.
    echo # Django
    echo db.sqlite3
    echo.
    echo # Variaveis de ambiente
    echo .env
    echo.
    echo # Testes e cache
    echo .pytest_cache/
) > .gitignore

REM ==========================================
REM CRIAR ARQUIVO DE COMANDOS
REM ==========================================

echo.
echo [7/7] Criando arquivo de comandos...

(
    echo ==========================================
    echo       COMANDOS UTEIS - DJANGO
    echo ==========================================
    echo.
    echo PROJETO:
    echo %PROJETO%
    echo.
    echo ==========================================
    echo AMBIENTE VIRTUAL
    echo ==========================================
    echo.
    echo Ativar:
    echo venv\Scripts\activate
    echo.
    echo Desativar:
    echo deactivate
    echo.
    echo ==========================================
    echo DJANGO
    echo ==========================================
    echo.
    echo Iniciar servidor:
    echo python manage.py runserver
    echo.
    echo Criar app:
    echo python manage.py startapp NOME_DO_APP
    echo.
    echo Exemplo:
    echo python manage.py startapp usuarios
    echo.
    echo ==========================================
    echo BANCO DE DADOS
    echo ==========================================
    echo.
    echo Criar migrations:
    echo python manage.py makemigrations
    echo.
    echo Aplicar migrations:
    echo python manage.py migrate
    echo.
    echo ==========================================
    echo SUPERUSUARIO
    echo ==========================================
    echo.
    echo Criar superusuario:
    echo python manage.py createsuperuser
    echo.
    echo ==========================================
    echo DEPENDENCIAS
    echo ==========================================
    echo.
    echo Instalar requirements:
    echo python -m pip install -r requirements.txt
    echo.
    echo Atualizar requirements:
    echo python -m pip freeze ^> requirements.txt
    echo.
    echo ==========================================
) > comandos_django.txt

REM ==========================================
REM FINAL
REM ==========================================

echo.
echo ==========================================
echo       PROJETO CRIADO COM SUCESSO!
echo ==========================================
echo.
echo Projeto:
echo %PROJETO%
echo.
echo Local:
echo %CAMINHO_PROJETO%
echo.
echo Estrutura:
echo.
echo %PROJETO%\
echo +--- venv\
echo +--- setup\
echo ^|    +--- __init__.py
echo ^|    +--- settings.py
echo ^|    +--- urls.py
echo ^|    +--- asgi.py
echo ^|    +--- wsgi.py
echo +--- manage.py
echo +--- requirements.txt
echo +--- .gitignore
echo +--- comandos_django.txt
echo.
echo ==========================================
echo.
echo Ambiente virtual ja esta ATIVO.
echo.
echo Para iniciar o servidor:
echo python manage.py runserver
echo.
echo Para criar um app:
echo python manage.py startapp nome_do_app
echo.
echo ==========================================
echo.

pause