.PHONY: certs package compose-build compose-up compose-down compose-logs clean

# full chain
certs-fullchain:
	./certs/generate-certs-fullchain.sh

build-fullchain: package certs-fullchain
	docker compose build

rebuild-fullchain: package certs-fullchain
	docker compose build --no-cache

# server only
certs-serveronly:
	./certs/generate-certs-serveronly.sh

build-serveronly: package certs-serveronly
	docker compose build

rebuild-serveronly: package certs-serveronly
	docker compose build --no-cache

# Global
package:
	mvn clean package

up:
	docker compose up

down:
	docker compose down

logs:
	docker compose logs -f

ps:
	while true; do clear; docker compose ps; sleep 3; done

clean:
	rm -rf api-client/target api-server/target certs/generated
