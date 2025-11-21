# Handshake HTTPS Demo

Ce dépôt contient deux modules Spring Boot empaquetés chacun dans son image Docker et orchestrés via Docker Compose :

- `api-server` expose `/api/hello` en HTTPS et retourne `"hello world"`.
- `api-client` expose `/api/forward` qui invoque l'API précédente via HTTPS et renvoie la réponse.

## Architecture du projet

- **Conteneurs** : `api-server` (port interne 8443) et `api-client` (port interne 8080) sont construits via leurs Dockerfile respectifs et publiés sous `handshake/api-server` et `handshake/api-client`.
- **Réseau** : Docker Compose crée un bridge interne ; le client atteint le serveur à l’URL `https://api-server:8443/api/hello` grâce au résolveur DNS interne.
- **Volumes** : `./certs/generated` est monté en lecture seule sur `/app/certs` dans les deux conteneurs pour injecter keystore/truststore sans les embarquer dans les images.
- **TLS côté serveur** : `api-server` démarre en HTTPS avec `SERVER_SSL_KEYSTORE` (clé et cert serveur) et `SERVER_SSL_TRUSTSTORE` (CAs acceptées si besoin de mutual TLS). Le mot de passe peut être surchargé via `${KEYSTORE_PASSWORD}` et `${TRUSTSTORE_PASSWORD}`.
- **TLS côté client** : `api-client` construit un `WebClient` qui charge `CLIENT_TRUSTSTORE` pour vérifier le certificat du serveur. L’URL descendante est configurable via `DOWNSTREAM_BASE_URL`.
- **Chemin des requêtes** : le navigateur (ou curl) appelle `http://localhost:8080/api/forward` → conteneur `api-client` → appel HTTPS sortant vers `api-server:8443` → réponse `"hello world"` renvoyée au client HTTP.
- **Exposition vers l’hôte** : les ports 8080 (client) et 8443 (serveur) sont mappés respectivement sur l’hôte pour tester directement depuis la machine locale.

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

## Makefile

Pour faciliter l'utilisation de docker compose, on va utiliser la commande `make`

Commandes utiles :
- `make certs` : génère les keystore et truststore pour les containers client et server
- `make build` : compile le projet
- `make rebuild` : recompile le projet (sans s'appuyer sur le cache)
- `make up` : démarre le projet
- `make down` : pour stopper les containers

Cas d'usage typique :
```bash 
- Dans le Makefile, modifier sur la première ligne la variable SCRIPT_CERTS pour pointer vers le script du scénario à tester
- make certs
- make down rebuild up
```

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


## Uses cases testés

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

=> tests KO (normal)
