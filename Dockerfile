FROM alpine
MAINTAINER Muhammad Lukman Nasaruddin <anatilmizun@gmail.com>

RUN apk add openssh-client bash && mkdir /etc/backups && mkdir -p ~/.ssh && mkdir -p /scripts

COPY scripts/* /scripts/

RUN chmod +x /scripts/*

VOLUME /etc/backups

ENV PATH="/scripts:${PATH}"

CMD ["tail", "-f", "/dev/null"]
