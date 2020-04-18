
.ONESHELL:
.SHELL := /usr/bin/bash
.PHONY: dev-apply dev-destroy prod-apply prod-destroy
#VARS="variables/$(ENV)-$(REGION).tfvars"

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

dev-init:
	@cd ENV/DEV
	@git pull
	@terraform init

prod-init:
	@cd ENV/PROD
	@git pull
	@terraform init

dev-apply: dev-init ## Create DEV environment
	@cd ENV/DEV
	@terraform apply -auto-approve

dev-destroy: dev-init ## Destroy DEV environment
	@cd ENV/DEV
	@terraform destroy -auto-approve

prod-apply: prod-init ## Create PROD environment
	@cd ENV/PROD
	@terraform apply -auto-approve

prod-apply-bg: ## Create PROD environment
	@cd ENV/BG
	@terraform init
	@terraform apply -auto-approve

prod-destroy: prod-init ## Destroy PROD environment
	@cd ENV/PROD
	@terraform destroy -auto-approve
