
export PROJECT_NAME = homelab-raspberry
export COMPOSE_PROJECT_NAME = ${PROJECT_NAME}


check-project:
ifndef PROJECT_NAME
	$(error PROJECT_NAME is required)
endif


make build:
	docker-compose build

shell: check-project check-env
	docker-compose run --rm infra bash


playbook: check-env
	docker-compose run --rm infra \
		ansible-playbook \
		-i inventory \
		playbook.yml
