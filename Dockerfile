FROM caddy:2.9-builder AS builder

RUN xcaddy build \
    --with github.com/RussellLuo/caddy-ext/ratelimit \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/WeidiDeng/caddy-cloudflare-ip \
    --with github.com/mholt/caddy-l4 \
    --with github.com/caddyserver/transform-encoder \
    --with github.com/hslatman/caddy-crowdsec-bouncer/http@main \
    --with github.com/hslatman/caddy-crowdsec-bouncer/appsec@main \
    --with github.com/hslatman/caddy-crowdsec-bouncer/layer4@main

FROM caddy:2.9

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
