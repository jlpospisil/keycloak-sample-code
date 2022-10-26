.PHONY: init plan apply destroy clean

init:
	docker-compose up -d

plan:
	terragrunt run-all plan --terragrunt-non-interactive --terragrunt-working-dir infrastructure/environments/local

apply:
	terragrunt run-all apply -auto-approve --terragrunt-non-interactive --terragrunt-working-dir infrastructure/environments/local

destroy:
	terragrunt run-all destroy -auto-approve --terragrunt-non-interactive --terragrunt-working-dir infrastructure/environments/local

clean:
	docker-compose down
	find . -name .terragrunt-cache -exec rm -rf {} \;
	find . -name .terraform.lock.hcl -exec rm -f {} \;
	rm -rf ./.data/postgres
