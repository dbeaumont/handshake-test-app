# Handshake HTTPS Demo

Ce dépôt contient deux modules Spring Boot empaquetés chacun dans son image Docker et orchestrés via Docker Compose :

- `api-server` expose `/api/hello` en HTTPS et retourne `"hello world"`.
- `api-client` expose `/api/forward` qui invoque l'API précédente via HTTPS et renvoie la réponse.

## Arborescence

```
.
├── api-client
│   ├── Dockerfile
│   ├── pom.xml
│   └── src/main/...
├── api-server
│   ├── Dockerfile
│   ├── pom.xml
│   └── src/main/...
├── certs
│   └── generate-certs.sh
├── docker-compose.yml
├── pom.xml
├── README.md
└── Prompt initial.md
```

## Génération des certificats

1. Assure-toi qu'un JDK 17+ est installé et que `JAVA_HOME` pointe vers ce JDK.
2. Exécute le script :
   ```bash
   ./certs/generate-certs.sh
   ```
   - Mot de passe par défaut : `changeit` (overridable via `PASSWORD`).
   - Le script crée `certs/generated/server-keystore.p12`, `server-truststore.p12`, `client-truststore.p12`, `api-server.crt`, `api-server-chain.crt`, `root-ca.crt` et `intermediate-ca.crt`.
   - La clé privée d'`api-server` est désormais liée à un certificat signé par une autorité intermédiaire, elle-même signée par une racine dédiée.
   - Le truststore client est basé sur le `cacerts` du JDK et enrichi avec la chaîne complète (racine + intermédiaire) et le certificat serveur exporté (-> c'est justelment ce qui est en cours d'étude).

## Construction des artefacts

Compile les deux modules :
```bash
mvn clean package
```
Les JAR nécessaires aux Dockerfiles sont alors disponibles dans `api-server/target` et `api-client/target`.

## Construction des images Docker

```bash
# depuis la racine du dépôt
docker compose build
```
Chaque image embarque uniquement le JRE et le JAR déjà construit. Les keystore/truststore sont montés au runtime.

## Lancement via Docker Compose

```bash
docker compose up
```
Variables utiles :
- `KEYSTORE_PASSWORD`, `TRUSTSTORE_PASSWORD`, `CLIENT_TRUSTSTORE_PASSWORD` pour remplacer les mots de passe par défaut dans `docker-compose.yml`.
- Le conteneur `api-client` embarque désormais `openssl` et ajoute automatiquement les certificats `api-server.crt`, `root-ca.crt` et `intermediate-ca.crt` au truststore système pour que les commandes OpenSSL (exécutées via `docker compose exec api-client ...`) valident correctement la chaîne complète.

Les volumes montent `./certs/generated` dans `/app/certs` pour les deux services.

## Tests

1. Vérifie que le serveur répond en HTTPS :
   ```bash
   curl https://localhost:8443/api/hello \
     --cacert certs/generated/root-ca.crt
   ```
2. Vérifie que le client relaie la réponse :
   ```bash
   curl http://localhost:8080/api/forward
   ```
   - Les logs du conteneur `api-client` afficheront les appels HTTPS sortants.
3. Optionnel : inspecte les certificats chargés en consultant les logs Spring (`docker compose logs api-server`) ou en regardant la chaîne complète avec `certs/generated/api-server-chain.crt`.
4. Vérifier les certificats envoyés par le serveur au client
   ```bash
   Dans le container client, lancer la commande :
   openssl s_client -connect "api-server:8443" -showcerts -servername "api-server"
   ```

## Notes supplémentaires

- Tous les chemins TLS sont configurables via les variables d'environnement visibles dans `application.yml` et `docker-compose.yml`.
- Le code `api-client` charge explicitement le truststore pour créer un `WebClient` sécurisé.
- `certs/generated` est ignoré par Git pour éviter les fuites de secrets.



## Uses cases

### Cas 1

Client Truststore : 
- Handshake Root CA
- Handshake Intermediate CA
- api-server

Server Keystore : 
- Handshake Root CA
- Handshake Intermediate CA
- api-server

Le handshake renvoit :
- Handshake Root CA
- Handshake Intermediate CA
- api-server

=> tests ok

### Cas 2

Client Truststore : 
- Handshake Root CA
- Handshake Intermediate CA
- api-server

Server Keystore : 
- Handshake Intermediate CA
- api-server

Le handshake renvoit :
- Handshake Intermediate CA
- api-server


=> tests ok

### Cas 3

Client Truststore : 
- Handshake Root CA
- Handshake Intermediate CA

Server Keystore :
- Handshake Root CA
- Handshake Intermediate CA
- api-server

Le handshake renvoit :
- Handshake Root CA
- Handshake Intermediate CA
- api-server

=> tests ok

### Cas 4

Test du contexte actuel de la PFE

Client Truststore : 
- Handshake Root CA
- Handshake Intermediate CA

Server Keystore :
- api-server

Le handshake renvoit :
- api-server

=> tests ???

A TESTER : Pour passer de 3 à 4, il faut modifier server keystore