.PHONY: certs package compose-build compose-up compose-down compose-logs clean

certs:
	./certs/generate-certs.sh

package:
	mvn clean package

build: package certs
	docker compose build

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
