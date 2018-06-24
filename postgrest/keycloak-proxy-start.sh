#!/bin/sh

echo "Starting keycloak proxy..."

exec /opt/keycloak-proxy \
--upstream-url=http://api:8180 \
--discovery-url=http://keycloak:8080/auth/realms/"${KEYCLOAK_REALM}" \
--openid-provider-timeout=60s \
--client-id="${KEYCLOAK_CLIENT_ID}" \
--listen=0.0.0.0:3001 \
--enable-logging=true \
--no-redirects=true \
--verbose=true \
--skip-token-verification=true # do not use in production
# we skip token validation in dev because the iss claim url is set to localhost
# not keycloak
