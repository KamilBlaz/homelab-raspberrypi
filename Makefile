
export PROJECT_NAME = homelab-raspberry
export COMPOSE_PROJECT_NAME = ${PROJECT_NAME}


check-project:
ifndef PROJECT_NAME
	$(error PROJECT_NAME is required)
endif

check-rolename:
ifndef ROLE_NAME
        $(error ROLE_NAME is required)
endif

make build:
	docker-compose build

shell: 
	docker-compose run --rm infra bash

init-role:
	docker-compose run --rm infra ansible-galaxy role init ${ROLE_NAME}

playbook-requirements:
	docker-compose run --rm infra ansible-galaxy install -r requirements.yml --force

playbook-lint:
	docker-compose run --rm -w /code infra \
		ansible-lint playbook.yml servers-playbook.yaml \
		-x var-spacing

ping: 
	docker-compose run --rm infra \
		ansible all -m ping -i inventory.ini 
playbook: 
	docker-compose run --rm infra \
		ansible-playbook \
		-i inventory.ini \
		playbook.yml
