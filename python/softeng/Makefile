.PHONY: lint
lint:
	@echo "Running flake8..."
	@rye run flake8 src
	@echo "Running mypy..."
	@rye run mypy src

.PHONY: format
format:
	@echo "Running black..."
	@rye run black src
	@echo "Running isort..."
	@rye run isort src

.PHONY: test
test:
	@echo "Running pytest..."
	@rye run pytest src

