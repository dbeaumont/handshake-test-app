FROM eclipse-temurin:17-jre

RUN apt-get update \
    && apt-get install -y --no-install-recommends openssl ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

ARG JAR_FILE=target/api-client-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} app.jar
COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]
