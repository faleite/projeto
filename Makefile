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
		@prospector --with-tool pydocstyle --doc-warning

test: # Roda os testes
		@pytest -v

sec: # Verifica segurança das bibliotecas
		@pip-audit

env: # Monta o ambiente virtual
		@poetry shell
