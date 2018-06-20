#!/bin/sh

echo "Keycloak Server: ${KEYCLOAK_SERVER}"
echo "Keycloak Realm: ${KEYCLOAK_REALM}"
echo "Starting keycloak proxy..."

./keycloak-proxy \
--upstream-url=http://"${KEYCLOAK_SERVER}":8080 \
--discovery-url=http://"${KEYCLOAK_SERVER}:8080"/auth/realms/"${KEYCLOAK_REALM}" \
--openid-provider-timeout=60s \
--client-id="${KEYCLOAK_CLIENT_ID}" \
--client-secret=76a0051d-f406-4ac8-a837-6394bc07bec3 \
--listen=127.0.0.1:3003
