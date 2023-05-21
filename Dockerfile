FROM caddy:2.7-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/caddy-dns/alidns \
    --with github.com/razonyang/caddy-dnspodcn
	
FROM caddy:2.7-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy