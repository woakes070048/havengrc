#!/bin/sh

echo "Keycloak Server: ${KEYCLOAK_SERVER}"
echo "Keycloak Realm: ${KEYCLOAK_REALM}"
echo "Starting keycloak proxy..."

./keycloak-proxy \
--upstream-url=http://localhost:8080 \
--discovery-url=http://"${KEYCLOAK_SERVER}:8080"/auth/realms/"${KEYCLOAK_REALM}" \
--redirection-url=https://localhost:3003 \
--openid-provider-timeout=60s \
--client-id="${KEYCLOAK_CLIENT_ID}" \
--client-secret=76a0051d-f406-4ac8-a837-6394bc07bec3 \
--resources="uri=/auth/*|white-listed=true" \
--resources="uri=/css/*|white-listed=true" \
--resources="uri=/img/*|white-listed=true" \
--resources="uri=/public/*|white-listed=true" \
--listen=0.0.0.0:3003 \
--enable-logging=true \
--verbose=true
