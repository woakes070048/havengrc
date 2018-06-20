FROM alpine
MAINTAINER          Kindly Ops, LLC <support@kindlyops.com>
COPY . /home/proxyuser/
RUN apk add --no-cache bash
RUN apk add --no-cache ca-certificates
RUN addgroup -S proxyuser && adduser -S -g proxyuser proxyuser
RUN chown -R proxyuser:proxyuser /home/proxyuser
WORKDIR /home/proxyuser
EXPOSE 3003
ENV KEYCLOAK_SERVER keycloak
ENV KEYCLOAK_REALM master
ENV KEYCLOAK_CLIENT_ID account
USER proxyuser
CMD ["./keycloak-proxy-start.sh"]
