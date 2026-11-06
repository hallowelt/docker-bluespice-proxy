FROM nginxproxy/nginx-proxy:alpine
RUN { \
      echo 'server_tokens off;'; \
      echo 'client_max_body_size 0;'; \
    } > /etc/nginx/conf.d/bluespice.conf

# Build info: value of build arg BUILDINFO, falls back to the UTC build timestamp (YmdHis)
ARG BUILDINFO
RUN mkdir -p /image && echo "${BUILDINFO:-$(date -u +%Y%m%d%H%M%S)}" > /image/BUILDINFO
