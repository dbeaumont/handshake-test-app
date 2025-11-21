SCRIPT_CERTS ?= "generate-certs-cas4.sh"

.PHONY: certs package compose-build compose-up compose-down compose-logs clean

certs:
	./certs/$(SCRIPT_CERTS)

build: package
	docker compose build

rebuild: package
	docker compose build --no-cache

full: down certs rebuilt up

package:
	mvn clean package

up:
	docker compose up -d

down:
	docker compose down

logs:
	docker compose logs -f

ps:
	while true; do clear; docker compose ps; sleep 3; done

clean:
	rm -rf api-client/target api-server/target certs/generated
