dev:
	pnpm run dev

deploy:
	docker-compose up --remove-orphans --build

init:
	terraform init -upgrade

apply:
	terraform apply --auto-approve	

destroy:
	terraform destroy --auto-approve