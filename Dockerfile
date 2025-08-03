FROM alpine:latest

LABEL org.opencontainers.image.source="https://github.com/suuppl/porkbun-ddns"
LABEL org.opencontainers.image.description="Porkbun DDNS Updater"
LABEL org.opencontainers.image.url="https://github.com/suuppl/porkbun-ddns/blob/main/README.md"
LABEL org.opencontainers.image.licenses=MIT

# default env variables
ENV FREQUENCY 5
ENV RECORD_TYPE A
ENV ENDPOINT "https://api.porkbun.com/api/json/v3"

# install dependencies
RUN apk update && apk add --no-cache tzdata curl bind-tools jq

# copy scripts over
COPY scripts /
RUN chmod 700 /entry.sh /container-setup.sh /ddns-update.sh

CMD ["/entry.sh"]
