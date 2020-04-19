
.ONESHELL:
.SHELL := /usr/bin/bash
.PHONY: dev-apply dev-destroy prod-apply prod-destroy
#VARS="variables/$(ENV)-$(REGION).tfvars"
IAM_ROLE=$(shell curl -s http://169.254.169.254/latest/meta-data/iam/info 2>/dev/null | grep -i success)

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

checks:
	@if [ -z "${IAM_ROLE}" ]; then
    	echo "Role Missing to run the code"
    	exit 1
    fi
    @if [ -z "${AWS_DEFAULT_REGION}" ]; then
    	echo -e "Region Missing, Variable AWS_DEFAULT_REGION needs to be exported"
    	exit 1
    fi

dev-init: checks
	@cd ENV/DEV
	@git pull
	@terraform init

prod-init: checks
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
