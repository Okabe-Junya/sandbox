LINTER := flake8
LINTER_CONFIG := .setup.cfg

FORMATTER := black
FORMATTER_CONFIG := .setup.cfg

.PHONY: help
help:
	@echo "Usage: make <target>"
	@echo "Targets:"
	@echo "  format - run code formatter"
	@echo "  lint - run code linter"

.PHONY: format
format:
	@echo "Running formatter..."
	@rye run $(FORMATTER) .

.PHONY: lint
lint:
	@echo "Running lint..."
	@rye run $(LINTER)

