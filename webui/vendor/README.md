# building caddy from source

We build caddy ourselves from source because we want the Apache 2 licensed version, not the non-free EULA covered binary version distributed from the caddy website.

We need the cors plugin and the JWT plugin and the route53 plugin

    go get -u github.com/mholt/caddy/caddy
    go get -u github.com/captncraig/cors/caddy
    go get -u github.com/BTBurke/caddy-jwt
    go get -u github.com/caddyserver/dnsproviders/route53

    # the old way was to use caddyext, that tool  seems to have disappeared
    # go get github.com/caddyserver/caddyext
    # also any caddy plugins that you want to add
    # caddyext install cors
    

    cd $GOPATH/src/github.com/mholt/caddy/caddy
    # edit caddymain/run.go and add these lines
    # _ "github.com/captncraig/cors/caddy"
    # _ "github.com/BTBurke/caddy-jwt"
    # _ "github.com/caddyserver/dnsproviders/route53"

    go run build.go -goos=linux -goarch=amd64
