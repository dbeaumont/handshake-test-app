# Prompt initial

Tu es un assistant spécialisé dans la génération de projets en Java. Crée un projet complet comprenant deux modules distincts, chacun packagé dans son propre conteneur Docker et orchestrés via Docker Compose.

1. Module “api-server” :
   - Spring Boot (Java).
   - Expose une API REST sécurisée en HTTPS qui retourne "hello world".
   - Utilise un keystore et un truststore pour activer TLS (fournis des exemples de fichiers keystore/truststore et de configuration Spring Boot).
   - Documente la génération des certificats, le montage des fichiers dans le conteneur Docker et la configuration Spring pour les consommer.

2. Module “api-client” :
   - Spring Boot (Java).
   - Conteneur Docker séparé.
   - Expose une API REST permettant de déclencher un appel sécurisé en HTTPS à l'API de "api-server" et qui en renvoie le retour.
   - Truststore basé sur le cacerts du JDK enrichi avec le certificat public du module “api-server”.
   - L'appel de l’API du module “api-server” en HTTPS est effectué en vérifiant le certificat via ce truststore.
   - Fournis la configuration Spring Boot nécessaire et les scripts/tests pour valider l’appel HTTPS.

Exigences supplémentaires :
- Donner l’arborescence complète du dépôt (racine + modules).
- Expliquer pas à pas la construction des images Docker, la gestion keystore/truststore, et le lancement via Docker Compose (ou scripts équivalents).
- Ajouter des instructions de test prouvant que le client communique bien avec l’API en HTTPS (ex. logs ou scripts de smoke test).
