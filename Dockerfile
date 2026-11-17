# ===== ETAGE 1 : BUILDER =====
FROM nginx:alpine AS builder
WORKDIR /build
COPY frontend/ ./
RUN ls -l && test -f index.html && test -f calcul-parts.js && echo "BUILD OK"

# ===== ETAGE 2 : FINAL =====
FROM nginx:alpine

COPY default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /build/index.html /usr/share/nginx/html/index.html
COPY --from=builder /build/calcul-parts.js /usr/share/nginx/html/calcul-parts.js

RUN sed -i 's|pid .*;|pid /tmp/nginx.pid;|' /etc/nginx/nginx.conf \
&& mkdir -p /tmp/client_temp /tmp/proxy_temp /tmp/fastcgi_temp /tmp/uwsgi_temp /tmp/scgi_temp /var/log/nginx \
&& chown -R nginx:nginx /tmp /var/cache/nginx /var/log/nginx /usr/share/nginx/html /etc/nginx

USER nginx
EXPOSE 8080
