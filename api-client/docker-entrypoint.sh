#!/usr/bin/env bash
set -euo pipefail

CERT_DIR="${CERTS_DIR:-/app/certs}"
COPIED=0

copy_cert() {
  local src="$1"
  local dest_name="$2"
  if [ -f "$src" ]; then
    cp "$src" "/usr/local/share/ca-certificates/$dest_name"
    COPIED=1
  fi
}

# Pour que openssl valide la chaine de certificats reçue par api-server, on va installer le certificat api-server racine au niveau système
# Certif Serveur
# copy_cert "${SERVER_PUBLIC_CERT:-$CERT_DIR/api-server.crt}" "api-server.crt"
# Certif Intermédiaire
# copy_cert "${CERT_DIR}/intermediate-ca.crt" "handshake-intermediate-ca.crt"
# Certif Racine
copy_cert "${CERT_DIR}/root-ca.crt" "handshake-root-ca.crt"

if [ "$COPIED" -eq 1 ]; then
  update-ca-certificates >/dev/null 2>&1 || echo "Impossible de mettre à jour le truststore OpenSSL" >&2
else
  echo "Aucun certificat trouvé dans $CERT_DIR" >&2
fi

exec java -jar /app/app.jar
