.PHONY: format
format:
	poetry run ruff format .
	poetry run mdformat *.md

.PHONY: lint
lint:
	poetry run ruff check .
	poetry run mypy .
	poetry run mdformat --check *.md
