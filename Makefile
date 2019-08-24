.PHONY: deploy
deploy:
	terraform init 
	terraform apply -auto-approve 

.PHONY: destroy
destroy:
	terraform init 
	terraform destroy -force 

