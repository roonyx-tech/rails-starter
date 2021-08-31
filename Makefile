# Rule "help"
help:
	@echo "\nUsage: make [target]\n\nTarget: \n"
	@grep -h "##" $(MAKEFILE_LIST) | grep -v "(help\|grep)" | sed -e "s/## //" -e 's/^/  /' -e 's/:/ -/'

build: ## Build the Dockerfile
	docker-compose build --force-rm

database: ## Setup database
	docker-compose run --rm rails bundle exec rake db:setup

migrate: ## Migrate database
	docker-compose run --rm rails bundle exec rails db:migrate

rollback: ## Rollback database
	docker-compose run --rm rails bundle exec rails db:rollback

bundle:
	docker-compose run --rm rails bundle

setup: build
setup: database

reset: ## Reset database
	docker-compose run --rm rails bundle exec rake db:schema:load db:seed

console: ## Rails console
	docker-compose run --rm rails bundle exec rails console