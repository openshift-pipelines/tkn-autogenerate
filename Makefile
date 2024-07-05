OUTPUT_DIR = bin
NAME  := tkn-autogenerate
GOLANGCI_LINT := $(shell command -v golangci-lint 2> /dev/null)

all: lint $(OUTPUT_DIR)/$(NAME)

mkdir: 
	@mkdir -p $(OUTPUT_DIR)

$(OUTPUT_DIR)/$(NAME): ./cmd/$(NAME)/*.go mkdir
	@echo "building..."
	@go build $(FLAGS)  -v -o $@ ./cmd/$(NAME)

lint: $(GOLANGCI_LINT)
	@echo "linting..."
	@$(GOLANGCI_LINT) run

.PHONY: lint mkdir all
