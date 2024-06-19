setup:
	@make build
	@make up
	@make composer-update

build:
	docker-composer build --no-cache --force-rm

stop:
	docker-compose stop

up:
	docker-compose up -d

composer-update:
	docker exec laravel-docker bash -c "composer update"

data:
	docker exec laravel-docker bash -c "php artisan migrate"