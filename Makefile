.PHONY: all
all: help


.PHONY: count-words
count-words: ## Count words in Markdown files
	@wc -w *.md


.PHONY: lint
lint: ## Run linters
	@yamllint openapi/*.yaml
	@yamllint docker/*.yaml


.PHONY: clean
clean: ## Remove generated pdfs
	@rm -f README.pdf
	@rm -f SYSTEM_DESIGN.pdf
	@rm -f SETUP_GUIDE.pdf
	@rm -f USAGE.pdf


.PHONY: generate-imgs
generate-imgs: ## Generate diagram images
	@echo "Generating PNG diagram:"
	@drawio -x -b 40 -s 1 -p 0 -o ./images/bin/logical_diagram.png ./images/src/diagrams.drawio


.PHONY: generate-pdfs
generate-pdf: ## Generates PDF docs
	@pandoc README.md -s -o README.pdf
	@pandoc SYSTEM_DESIGN.md -s -o SYSTEM_DESIGN.pdf
	@pandoc SETUP_GUIDE.md -s -o SETUP_GUIDE.pdf
	@pandoc USAGE.md -s -o USAGE.pdf


# ##############
# Docker section
# ##############


.PHONY: start-docker-env
start-docker-env: ## Set up and run docker environment
	@docker-compose -f docker/docker-compose.yaml -p pgw_app up -d


.PHONY: stop-docker-env
stop-docker-env: ## Tear down docker environment
	@docker-compose -f docker/docker-compose.yaml -p pgw_app down


##############################################################


GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
WHITE  := $(shell tput -Txterm setaf 7)
RESET  := $(shell tput -Txterm sgr0)


.PHONY: help
help: ## Show this help.
	@echo ''
	@echo 'Usage:'
	@echo '  ${YELLOW}make${RESET} ${GREEN}<target>${RESET}'
	@echo ''
	@echo 'Targets:'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  ${YELLOW}%-18s${GREEN}%s${RESET}\n", $$1, $$2}' $(MAKEFILE_LIST)
