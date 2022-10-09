# Como organizar um projeto Python

#### 1. Estrutura de diretórios

Pastas|Função
------|------
**projeto**| *diretório principal - raiz - incial - projeto*
**docs**| *toda documentação do projeto*
**Código-fonte**| *Geramente leva o nome do projeto ou src, onde fica todo código fonte*
**tests**| *Onde fica todos o arquivos de testes do projeto*
**actions**| *.github*
**scripts**| *scripts/tools de toda natureza, organizar diversas coisas*

---

#### 2. Ferramentas de desenvolvimento

- Escolher a versão do Python
    - preferêncialmente usar a ultima versão possivel
    - depende de ferramentas como ex.: fremeworks que suporte tais versões
    - Para setar a versão de python podemos usar a ferramenta **pyenv**

**pyenv:** Cria um ambiente python isolado do OS, ou isola um projeto/diretório específico.

Comandos|Função
--------|------
**pyenv versions**| *Listar as versões de python instalada e qual esta sendo usada globalmente*
**pyenv install 3.10.5**| *Instala a versão 3.10.2 do python*
**pyenv local 3.10.5**| *Faz com que o projeto passe a usar a versão 3.10.2 do python*
**python --version**| *Mostra a versão de python*

> pyenv local -> Criará o arquivo .python-version (seta a versão do python neste arquivo)


- Criar o ambiente virtual
    - escolha da ferramenta para criação do ambiente virtual
        - virtualenv, **venv**, **poetry**, pipenv e etc...
