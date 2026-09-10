@echo off
setlocal

title Inicializador de Projeto Python

echo.
echo ==========================================
echo       INICIALIZADOR DE PROJETO PYTHON
echo ==========================================
echo.

:: Caminho base
set "BASE=C:\Users\025747\Desktop"

:: Pede o nome do projeto
set /p PROJECT_NAME=Digite o nome do projeto: 

if "%PROJECT_NAME%"=="" (
    echo.
    echo [ERRO] Nome do projeto nao informado.
    pause
    exit /b 1
)

:: Caminho completo
set "PROJECT_PATH=%BASE%\%PROJECT_NAME%"

echo.
echo Criando projeto em:
echo %PROJECT_PATH%
echo.

:: Verifica se a pasta ja existe
if exist "%PROJECT_PATH%" (
    echo [ERRO] A pasta "%PROJECT_NAME%" ja existe.
    echo Escolha outro nome ou remova a pasta existente.
    pause
    exit /b 1
)

:: Cria estrutura de pastas
mkdir "%PROJECT_PATH%"
mkdir "%PROJECT_PATH%\src"
mkdir "%PROJECT_PATH%\tests"

if errorlevel 1 (
    echo [ERRO] Nao foi possivel criar as pastas.
    pause
    exit /b 1
)

:: Entra no projeto
cd /d "%PROJECT_PATH%"

echo.
echo [1/6] Criando ambiente virtual...

python -m venv .venv

if errorlevel 1 (
    echo.
    echo [ERRO] Nao foi possivel criar a venv.
    echo Verifique se o Python esta instalado e no PATH.
    pause
    exit /b 1
)

echo.
echo [2/6] Atualizando pip...

call ".venv\Scripts\activate.bat"

python -m pip install --upgrade pip

if errorlevel 1 (
    echo.
    echo [ERRO] Falha ao atualizar o pip.
    pause
    exit /b 1
)

echo.
echo [3/6] Instalando pytest...

python -m pip install pytest

if errorlevel 1 (
    echo.
    echo [ERRO] Falha ao instalar o pytest.
    pause
    exit /b 1
)

echo.
echo [4/6] Criando arquivos do projeto...

:: main.py
(
    echo def main^(^):
    echo     print^("Ola, mundo!"^)
    echo.
    echo.
    echo if __name__ == "__main__":
    echo     main^(^)
) > "%PROJECT_PATH%\src\main.py"

:: test_main.py
(
    echo def test_exemplo^(^):
    echo     assert 1 + 1 == 2
) > "%PROJECT_PATH%\tests\test_main.py"

:: requirements.txt
(
    echo pytest
) > "%PROJECT_PATH%\requirements.txt"

:: .gitignore
(
    echo # Ambiente virtual
    echo .venv/
    echo.
    echo # Python
    echo __pycache__/
    echo *.py[cod]
    echo *.pyo
    echo.
    echo # Testes
    echo .pytest_cache/
    echo.
    echo # IDEs
    echo .vscode/
    echo .idea/
) > "%PROJECT_PATH%\.gitignore"

:: README.md
(
    echo # %PROJECT_NAME%
    echo.
    echo Projeto Python.
    echo.
    echo ## Ambiente virtual
    echo.
    echo Para ativar a venv:
    echo.
    echo     .venv\Scripts\activate
    echo.
    echo ## Testes
    echo.
    echo Para executar os testes:
    echo.
    echo     pytest
) > "%PROJECT_PATH%\README.md"

echo.
echo [5/6] Verificando pytest...

python -m pytest --version

if errorlevel 1 (
    echo.
    echo [ERRO] O pytest nao foi instalado corretamente.
    pause
    exit /b 1
)

echo.
echo [6/6] Projeto criado com sucesso!
echo.
echo ==========================================
echo              PROJETO PRONTO
echo ==========================================
echo.
echo Pasta:
echo %PROJECT_PATH%
echo.
echo Estrutura:
echo.
echo %PROJECT_NAME%\
echo +--- .venv\
echo +--- src\
echo ^|    +--- main.py
echo +--- tests\
echo ^|    +--- test_main.py
echo +--- requirements.txt
echo +--- .gitignore
echo +--- README.md
echo.
echo ==========================================
echo.

pause