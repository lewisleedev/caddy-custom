FROM caddy:2.8-builder AS builder

RUN xcaddy build \
    --with github.com/RussellLuo/caddy-ext/ratelimit \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/WeidiDeng/caddy-cloudflare-ip \

FROM caddy:2.8

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
