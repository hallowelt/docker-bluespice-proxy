FROM nginxproxy/nginx-proxy:alpine
RUN { \
      echo 'server_tokens off;'; \
      echo 'client_max_body_size 0;'; \
    } > /etc/nginx/conf.d/bluespice.conf

# Build timestamp (UTC, YmdHis)
RUN mkdir -p /image && date -u +%Y%m%d%H%M%S > /image/BUILDINFO
