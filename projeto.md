# Como organizar um projeto Python

#### 1. Estrutura de diretórios

Pastas|Função
------|------
**projeto**| *diretório principal - raiz - incial - projeto*
**docs**| *toda documentação do projeto*
**código-fonte**| *Geramente leva o nome do projeto ou src, onde fica todo código fonte*
**tests**| *Onde fica todos o arquivos de testes do projeto*
**actions**| *.github*
**scripts**| *scripts/tools de toda natureza, organizar diversas coisas*

---

#### 2. Ferramentas de desenvolvimento

- **Escolher a versão do Python**
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

- **Criar o ambiente virtual**
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

- **Versionameto de código com o git**
    - Adicionar projeto ao **git**
        - *Tutorial prático de git [aqui](https://github.com/faleite/tutors/blob/1b9c0561053c593961ced11d22fd16ad617c6591/git.md)*
        - Outro excelente tutorial de [git](https://gitfichas.com)
    - Criar arquivo **.gitignore** na raiz do projeto
        - Para gerar arquivos a serem ignorados pode usar o [gitignore.io](https://www.toptal.com/developers/gitignore)
        - Lembre de enviar o .gitignore para o git
