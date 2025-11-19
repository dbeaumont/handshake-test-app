#!/usr/bin/env bash
set -euo pipefail

PASSWORD=${PASSWORD:-changeit}
CACERTS_PASSWORD=${CACERTS_PASSWORD:-changeit}
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
OUT_DIR="$SCRIPT_DIR/generated"
ROOT_ALIAS="handshake-root-ca"
INTERMEDIATE_ALIAS="handshake-intermediate-ca"
SERVER_ALIAS="api-server"

if ! command -v keytool >/dev/null 2>&1; then
  echo "keytool doit être disponible dans le PATH" >&2
  exit 1
fi

if [ -z "${JAVA_HOME:-}" ]; then
  JAVA_BIN="$(command -v java)"
  if [ -z "$JAVA_BIN" ]; then
    echo "java n'est pas disponible dans le PATH" >&2
    exit 1
  fi
  JAVA_HOME="$(dirname "$(dirname "$JAVA_BIN")")"
fi

# Surcharge pour MacOS
JAVA_HOME="/opt/homebrew/opt/openjdk/libexec/openjdk.jdk/Contents/Home"

CACERTS_FILE="$JAVA_HOME/lib/security/cacerts"
if [ ! -f "$CACERTS_FILE" ]; then
  echo "Impossible de localiser le fichier cacerts dans $CACERTS_FILE" >&2
  exit 1
fi

rm -rf "$OUT_DIR"
mkdir -p "$OUT_DIR"

SERVER_KEYSTORE="$OUT_DIR/server-keystore.p12"
SERVER_TRUSTSTORE="$OUT_DIR/server-truststore.p12"
CLIENT_TRUSTSTORE="$OUT_DIR/client-truststore.p12"
SERVER_CERT="$OUT_DIR/api-server.crt"
SERVER_CHAIN="$OUT_DIR/api-server-chain.crt"
ROOT_KEYSTORE="$OUT_DIR/root-ca-keystore.p12"
ROOT_CERT="$OUT_DIR/root-ca.crt"
INTERMEDIATE_KEYSTORE="$OUT_DIR/intermediate-ca-keystore.p12"
INTERMEDIATE_CERT="$OUT_DIR/intermediate-ca.crt"
INTERMEDIATE_CSR="$OUT_DIR/intermediate-ca.csr"
SERVER_CSR="$OUT_DIR/api-server.csr"
SAN_DNS="${SERVER_SAN_DNS:-dns:api-server,dns:localhost}"

echo "Génération de la chaîne racine -> intermédiaire -> serveur..."

# 1. Racine auto-signée
keytool -genkeypair \
  -alias "$ROOT_ALIAS" \
  -keyalg RSA \
  -keysize 4096 \
  -storetype PKCS12 \
  -keystore "$ROOT_KEYSTORE" \
  -storepass "$PASSWORD" \
  -keypass "$PASSWORD" \
  -validity 3650 \
  -dname "CN=Handshake Root CA, O=Handshake, C=FR" \
  -ext bc:c=ca:true \
  -ext ku:c=keyCertSign,cRLSign >/dev/null

keytool -exportcert \
  -alias "$ROOT_ALIAS" \
  -keystore "$ROOT_KEYSTORE" \
  -storepass "$PASSWORD" \
  -rfc \
  -file "$ROOT_CERT" >/dev/null

echo "✔ Racine générée : $ROOT_CERT"

# 2. Autorité intermédiaire signée par la racine
keytool -genkeypair \
  -alias "$INTERMEDIATE_ALIAS" \
  -keyalg RSA \
  -keysize 4096 \
  -storetype PKCS12 \
  -keystore "$INTERMEDIATE_KEYSTORE" \
  -storepass "$PASSWORD" \
  -keypass "$PASSWORD" \
  -validity 1825 \
  -dname "CN=Handshake Intermediate CA, O=Handshake, C=FR" \
  -ext bc:c=ca:true,pathlen:0 \
  -ext ku:c=keyCertSign,cRLSign >/dev/null

keytool -certreq \
  -alias "$INTERMEDIATE_ALIAS" \
  -keystore "$INTERMEDIATE_KEYSTORE" \
  -storepass "$PASSWORD" \
  -file "$INTERMEDIATE_CSR" >/dev/null

keytool -gencert \
  -alias "$ROOT_ALIAS" \
  -keystore "$ROOT_KEYSTORE" \
  -storepass "$PASSWORD" \
  -keypass "$PASSWORD" \
  -infile "$INTERMEDIATE_CSR" \
  -outfile "$INTERMEDIATE_CERT" \
  -rfc \
  -validity 1825 \
  -ext bc:c=ca:true,pathlen:0 \
  -ext ku:c=keyCertSign,cRLSign >/dev/null

keytool -importcert \
  -alias "$ROOT_ALIAS" \
  -file "$ROOT_CERT" \
  -keystore "$INTERMEDIATE_KEYSTORE" \
  -storepass "$PASSWORD" \
  -noprompt >/dev/null

keytool -importcert \
  -alias "$INTERMEDIATE_ALIAS" \
  -file "$INTERMEDIATE_CERT" \
  -keystore "$INTERMEDIATE_KEYSTORE" \
  -storepass "$PASSWORD" \
  -noprompt >/dev/null

echo "✔ Autorité intermédiaire générée : $INTERMEDIATE_CERT"

# 3. Certificat serveur signé par l'intermédiaire
keytool -genkeypair \
  -alias "$SERVER_ALIAS" \
  -keyalg RSA \
  -keysize 4096 \
  -storetype PKCS12 \
  -keystore "$SERVER_KEYSTORE" \
  -storepass "$PASSWORD" \
  -keypass "$PASSWORD" \
  -validity 825 \
  -dname "CN=api-server, OU=Dev, O=Handshake, L=Paris, C=FR" \
  -ext san="$SAN_DNS" \
  -ext ku=digitalSignature,keyEncipherment >/dev/null

keytool -certreq \
  -alias "$SERVER_ALIAS" \
  -keystore "$SERVER_KEYSTORE" \
  -storepass "$PASSWORD" \
  -file "$SERVER_CSR" >/dev/null

keytool -gencert \
  -alias "$INTERMEDIATE_ALIAS" \
  -keystore "$INTERMEDIATE_KEYSTORE" \
  -storepass "$PASSWORD" \
  -keypass "$PASSWORD" \
  -infile "$SERVER_CSR" \
  -outfile "$SERVER_CERT" \
  -rfc \
  -validity 825 \
  -ext ku=digitalSignature,keyEncipherment \
  -ext eku=serverAuth \
  -ext san="$SAN_DNS" >/dev/null

cat "$SERVER_CERT" "$INTERMEDIATE_CERT" "$ROOT_CERT" > "$SERVER_CHAIN"

keytool -importcert \
  -alias "$SERVER_ALIAS" \
  -file "$SERVER_CHAIN" \
  -keystore "$SERVER_KEYSTORE" \
  -storepass "$PASSWORD" \
  -noprompt >/dev/null

echo "✔ Certificat serveur signé (chaîne complète dans $SERVER_CHAIN)"

rm -f "$INTERMEDIATE_CSR" "$SERVER_CSR"

# 4. Truststores
keytool -importcert \
  -alias "$ROOT_ALIAS" \
  -file "$ROOT_CERT" \
  -keystore "$SERVER_TRUSTSTORE" \
  -storetype PKCS12 \
  -storepass "$PASSWORD" \
  -noprompt >/dev/null

keytool -importcert \
  -alias "$INTERMEDIATE_ALIAS" \
  -file "$INTERMEDIATE_CERT" \
  -keystore "$SERVER_TRUSTSTORE" \
  -storepass "$PASSWORD" \
  -noprompt >/dev/null

echo "Truststore serveur créé avec la racine + l'intermédiaire : $SERVER_TRUSTSTORE"

keytool -importkeystore \
  -srckeystore "$CACERTS_FILE" \
  -srcstorepass "$CACERTS_PASSWORD" \
  -destkeystore "$CLIENT_TRUSTSTORE" \
  -deststorepass "$PASSWORD" \
  -deststoretype PKCS12 \
  -noprompt >/dev/null

echo "Truststore client initialisé à partir de cacerts"

keytool -importcert \
  -alias api-server-local \
  -file "$SERVER_CERT" \
  -keystore "$CLIENT_TRUSTSTORE" \
  -storepass "$PASSWORD" \
  -noprompt

keytool -importcert \
  -alias "$ROOT_ALIAS" \
  -file "$ROOT_CERT" \
  -keystore "$CLIENT_TRUSTSTORE" \
  -storepass "$PASSWORD" \
  -noprompt

keytool -importcert \
  -alias "$INTERMEDIATE_ALIAS" \
  -file "$INTERMEDIATE_CERT" \
  -keystore "$CLIENT_TRUSTSTORE" \
  -storepass "$PASSWORD" \
  -noprompt

echo "Certificat du serveur importé dans le truststore client"

echo
cat <<MSG
Artefacts générés dans $OUT_DIR :
- server-keystore.p12
- server-truststore.p12
- client-truststore.p12
- api-server.crt
- api-server-chain.crt
- root-ca.crt
- intermediate-ca.crt

Montez-les dans vos conteneurs via docker-compose.yml.
MSG
