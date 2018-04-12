FROM nginx:latest

ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    TERM=xterm \
    TZ=Europe/Moscow

### Curl install
RUN apt-get update && apt-get install -y curl gnupg


### set User
RUN groupadd --gid 1001 web \
  && useradd --uid 1001 --gid web --shell /bin/bash --create-home web


CMD ["nginx", "-g", "daemon off;"]
# ### Install supervisor
# RUN apt-get update && apt-get install -y supervisor \
#     && mkdir -p  /var/log/supervisor


# CMD ["/usr/bin/supervisord"]
