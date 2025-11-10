TF = terraform
TFVARS = envs/dev/terraform.tfvars

.PHONY: bootstrap package-lambda init plan apply destroy fmt validate

bootstrap:
	@echo "==> Bootstrap: create backend S3 bucket and DynamoDB lock table"
	cd bootstrap && $(TF) init
	cd bootstrap && $(TF) apply -var="backend_bucket_name=mi-tf-state-$(shell whoami | tr -d '\n' | tr '[:upper:]' '[:lower:]')" -var="lock_table_name=mi-tf-locks-$(shell whoami | tr -d '\n' | tr '[:upper:]' '[:lower:]')" -auto-approve

package-lambda:
	@echo "==> Packaging lambda into examples/functions/lambda.zip"
	cd examples/functions && zip -r ../lambda.zip handler.py

init:
	$(TF) init -backend-config="bucket=$(BACKEND_BUCKET)" || $(TF) init

plan:
	$(TF) fmt -recursive
	$(TF) validate
	$(TF) plan -var-file=$(TFVARS)

apply:
	$(TF) apply -var-file=$(TFVARS)

destroy:
	$(TF) destroy -var-file=$(TFVARS)

fmt:
	$(TF) fmt -recursive

validate:
	$(TF) validate
