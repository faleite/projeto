# Como organizar um projeto Python

## 1. Estrutura de diretórios
Pastas|Função
------|------
**projeto**| *diretório principal - raiz - incial - projeto*
**docs**| *toda documentação do projeto*
**código-fonte**| *Geramente leva o nome do projeto ou src, onde fica todo código fonte*
**tests**| *Onde fica todos o arquivos de testes do projeto*
**actions**| *.github*
**scripts**| *scripts/tools de toda natureza, organizar diversas coisas*

---

## 2. Ferramentas de desenvolvimento

#### 1. Escolher a versão do Python
- Preferêncialmente usar a ultima versão possivel
- Depende de ferramentas como ex.: fremeworks que suporte tais versões
- Para setar a versão de python podemos usar a ferramenta **pyenv**

**pyenv:** Cria um ambiente python isolado do OS, ou isola um projeto/diretório específico.

Comandos|Função
--------|------
**pyenv versions**| *Listar as versões de python instalada e qual esta sendo usada globalmente*
**pyenv install 3.10.5**| *Instala a versão 3.10.5 do python*
**pyenv local 3.10.5**| *Faz com que o projeto passe a usar a versão 3.10.5 do python*
**python --version**| *Mostra a versão de python*

> pyenv local -> Criará o arquivo .python-version (seta a versão do python neste arquivo)

---

#### 2 . Criar o ambiente virtual
- Escolha da ferramenta para criação do ambiente virtual
    - virtualenv, **venv**, **poetry**, pipenv e etc...
- Neste projeto utilizaremos a ferramenta **poetry**
    - Para instalar o **poetry** utilize o **pipx**
        - **pipx** instala ferramentas de linha de comando em um ambiente virtual isolado
        - **pipx** é bom para instalações de ferramentas de uso globais

*Instalação do pipx e poetry:*

Comandos|Função
--------|------
**brew install pipx**| *Instala pipx no MacOs**
**pipx ensurepath**| *Habilita o $PATH do pix no .zshrc*
**source .zshrc**| *Atualiza o arquivo .zshrc para que pipx funcione*
**pipx install poetry**| *Instala o poetry*

*Criação de ambiente virtual:*

Comandos|Função
--------|------
**poetry init -n**| *Inicia o projeto criando o arquivo pyproject.toml*:
**poetry config virtualenvs.in-project true**| *Para crir o virtualenv dentro do projeto*
**poetry install**| *Cria um ambiente virtual*
**poetry shell**| *Inicia o ambiente virtual*
**poetry add <pacote\>**| *Instala pacotes*
**poetry add --dev <pacote\>**| *Instala pacotes para desenvolvimento*

*Outra opção é criar uma estrutura inicial de diretórios automatizada:*

```sh
poetry new <nome-projeto>
```
*O comando anterior cria a seguinte estrutura de diretórios:*

```sh
projeto
├── projeto
│   └── __init__.py
├── pyproject.toml
├── README.rst # Pode ser alterado para README.md
└── tests
    ├── __init__.py
    └── test_projeto_x.py
```

*Exemplo do pyproject.toml:*

```toml
[tool.poetry]
name = "projeto"
version = "0.1.0"
description = "Implementação da cifra de cesar - by Eduado Mendes 'Live de Python'"
authors = ["Fabricio Araujo <fabricio_2310@hotmail.com>", "dunossauro"]
readme = "README.md"

[tool.poetry.dependencies]
python = "^3.10" # ^ Qualquer versão do python que seja maior que 3.10


[build-system]
requires = ["poetry-core"]
build-backend = "poetry.core.masonry.api"
```
---

#### 3. Versionameto de código com o git
- Adicionar projeto ao **git**
    - *Tutorial prático de git [aqui](https://github.com/faleite/tutors/blob/1b9c0561053c593961ced11d22fd16ad617c6591/git.md)*
    - Outro excelente tutorial de [git](https://gitfichas.com)
- Criar arquivo **.gitignore** na raiz do projeto
    - Para gerar arquivos a serem ignorados pode usar o [gitignore.io](https://www.toptal.com/developers/gitignore)
    - Lembre de enviar o .gitignore para o git
---

#### 4. Testes
- Temos diversas ferramentas para testes
    - [pytest](https://www.youtube.com/watch?v=MjQCvJmc31A), [unittest](https://www.youtube.com/watch?v=Sr9lUR1COpU), [behave](https://youtu.be/ReELqf9B86g), ward, e etc...
    - Neste projeto utilizaremos o **pytest**

*Usando o pytest:*

Comando|Função
-------|------
**poetry add --dev pytest**| *Instala o pytest nas dependências dev*
**mkfir tests**| *Criar diretório de testes na raiz do projeto*
**touch tests/__init\__.py**| *Criar arquivo init na pasta tests*
**pytest**| *Roda os testes*
**pytest -v**| *Roda os testes com detalhes*

*Para criar um teste, crie um arquivo com o nome:\
**test**_nome_arquivo.py, na pasta tests/*

*Exemplo de testes com o arquivo test_encripta.py*:

```py
# test_encripta.py

# Na pasta cesar no arquivo cesar import a funçao encripta
from cesar.cesar import encripta


def test_encripta_fabricio_retorna_snoevpvb():
    assert encripta('Fabricio') == 'snoevpvb'


def test_encripta_snoevpvb_retorna_fabricio():
    assert encripta('snoevpvb') == 'fabricio'


def test_encripta_deve_retornar_minusculas():
    assert encripta('A').islower()


def test_encripta_deve_preservar_os_espaços():
    resultado = encripta('e a')
    assert resultado[1] == ' '
```
---

## 3. Ferramentas de checagem

#### 1. Formatadores de código
- Ferramentas de formatação, padronizam a maneira de escrever código
- Algumas das ferramentas utilizadas:
    - blue, black, isort, autopep8, YAPF, **darker**, Flake8 e etc...
- Neste projeto utilizaremos o **blue** e **isort**
    - **blue** é um fork do black, utiliza o black e o Flake8
        - Padornizações como: linha com 79 caracteres, troca aspas " " por ' '\
coloca espaçamentos corretos, e etc...
    - **isort** faz a ordenação dos imports

*Usando o blue:*

Comando|Função
-------|------
**poetry add --dev blue**| *Instalação do blue com o poetry*
**blue .**| *Formata todos os códigos do projeto, para o padrão PEP8*
**blue cesar/cesar.py**| *Formata o código dentro do padrão PEP8*
**git diff cesar/cesar.py**| *Mostra a diferença do código formatado*

*Usando o isort:*

Comando|Função
-------|------
**poetry add --dev isort**| *Instalação do isort com o poetry*
**isort .**| *Formata todos os arquivos do projeto para ordenação dos imports*
**isort . --check**| *Olha todos os arquivos do projeto e mostra se tem algo errado*

- **Mais sobre padronização de código**
    - [Live de padronização de código](https://youtu.be/bqxXWfCrUXs)
    - [Live complexidade de código](https://youtu.be/qG-F5tordqc)
---

#### 2. Análise estática (Checagens - Linters)
- As ferramentas de Análise estática procuram:
    - Erros de sintaxe
    - Potenciais problemas
        - Nomes duplicados
        - Nomes ruins
        - Códigos inseguros
    - Análise de complexidade de código
    - Violações de convenções
        - PEP-8 (Conveção sobre linhas, espaços e imports ...)
        - PEP-257 (Conveção de Docstrings)
-  Existem diversas ferramentas nessa linha, algumas recomendações:
    - **flake8:** Checador da pep-8
    - **pylint:** Padronização, convensões e erros
    - **pydocstyle:** Checador da PEP-257
    - **bandit:** Problemas de segurança
    - **Radon:** Busca de complexidade de código
    - **Prospector:** Agregador de ferramentas
        - Flake8, Mccabe, pylint, pep8, pep257, ...
    - **mypy:** Checador de sugestões de tipo
    - ...

*Neste projeto utilizaremos o **Prospector**:*

Comando|Função
-------|------
**poetry add --dev prospector**| *Instala o prospector*
**prospector**| *Roda as análises*
**prospector --with-toll pydocstyle**| *Executa também a checagem de docstrings*

#### 3. Segurança de Bibliotecas
- A falta de atualizações das Bibliotecas de um projeto, pode trazer\
vulnerabilidade de segurança.
- Algumas ferramentas que podem ajudar
    - **pip-audit**
    - **safety**
    - **pyup**

*Neste projeto utilizaremos o **pip-audit**:*
>*Esta ferramenta olha todas as bibliotecas baixadas do projeto\
>e mostra se há alguma vulnerabilidade de segurança*

Comando|Função
-------|------
**poetry add --dev pip-audit**| *Instala o pip-audit*
**pip-audit**| *Roda as análises*

---

## 4. Documentação

#### 1. README
- README.md

#### 2. Criadores de documentação
- Existem ferramentas para formatar documentação
    - **mkdocs**, sphinx e etc ...
    - Neste projeto utilizaremos o **mkdocs**

*Usando o mkdocs, comandos básicos:*

Comando|Função
-------|------
**poetry add --dev mkdocs**| *Instala o mkdocs*
**mkdocs new .**| *Cria a pasta /docs e o arquivo mkdocs.yml no projeto*
**mkdocs serve**| *Cria um site com a dumentação implementada*

*No arquivo mkdocs.yml seta configurações, inicialmente colocamos o nome do site*\
*No arquivo index.md em /docs/index.md, escrevemos a documentação em markdown*

- **Saiba mais sobre mkdocs**
    - [Live de MkDocs](https://youtu.be/GW6nAJ1NHUQ)

---

## 5. Automações

#### 1. Facilitando a vida e os comandos
- Comandos usados no projeto
    - pyenv, poetry, blue, isort, prospector, pip-audit, pytest,\
mkdocs, pydocstyle ...
- Existe a ferramenta **GNU Make** para auxiliar neste processo

*Uso da ferramenta:*
1. *Crie um arquivo na raiz do projeto com o nome **Makefile***
2. *Edite o arquivo, com os parâmetros com forme exemplo abaixo:*

*Exemplo de **Makefile**:*
```Makefile
.PHONY: install format lint test sec # Basicamente torna o Makefile mais rápido

install: # Cria ambiente virtual
		@poetry install # '@' -> faz com que não mostre o comando que esta executando

# Ex. uso com o pip:
# python -m ven venv
# pip install -r requirementes.txt

format: # Formatação do código
		@isort .
		@blue .

lint: # Checagem do código
		@blue . --check
		@isort . --check
		@prospector --with-tool pydocstyle --doc-warning --no-autodetect
# --no-autodetect -> resolve bug do prospector sobre pylint-django

test: # Roda os testes
		@pytest -v

sec: # Verifica segurança das bibliotecas
		@pip-audit

env: # Monta o ambiente virtual
		@poetry shell
```

Comando|Função
-------|------
**make install**|*Cria o ambiente virtual*
**make format**| *Formata o código*
**make lint**| *Checa do código*
**make test**| *Roda os testes*
**make sec**| *Verifica a segurança das bibliotecas*
**make env**| *Monta o ambiente virtual*

- **Saiba mais sobre GNU Make**
    - [Live sobre GNU Make](https://youtu.be/Bb_TvqoUxX4)

#### 2. Usando o **hooks** do **git**
- Usamos o **hooks** para rodar checagens e testes...
    - Antes do commit
    - Antes do rebase
    - Antes do push
    - Antes do merge
    - ...

*Uso básico do **hooks**:*

Comando|Função
-------|------
**touch git/hooks/pre-commit**| *Criar o arquivo pre-commit no diretório **hooks***
**chmod +x pre-commit**| *Tornar o arquivo **pre-commit** executável*

*Exemplo de uso do arquivo **pre-commit**:*

```sh
# pre-commit
make lint # roda os linters antes do commit, só faz o commit se passar nos testes
make test # roda os testes antes do commit, só faz o commit se passar nos testes
```

#### 3. Usando o Actions
- Faz checagens no repositório
    - Github Actions, Gitlab ...
    - Neste projeto utilizaremos o **github actions**

*Uso do **Github Actions**:*

Comando|Função
-------|------
**mkdir .github/**| *Cria diretório .github no projeto*
**mkdir .github/workflows**| *Cria diretório workflows no .github do projeto*
**touch .github/workflows/continous_integration.yml**| *Cria aquivo de configuração do actions*

- **Saiba mais sobre Actions**
    - [Live sobre Github Actions](https://youtu.be/L1f6N6NcgPw)

---


