FROM nginxproxy/nginx-proxy:alpine
RUN { \
      echo 'server_tokens off;'; \
      echo 'client_max_body_size 0;'; \
    } > /etc/nginx/conf.d/bluespice.conf

# Build info: value of build arg BUILDINFO, `-` if not set
ARG BUILDINFO
RUN mkdir -p /image && echo "${BUILDINFO:--}" > /image/BUILDINFO
