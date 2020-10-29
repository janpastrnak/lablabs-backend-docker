# TASK:
# Treba implementovat vraci zadania
#
# Aplikacia je by default dostupna na porte 8080

FROM golang:1.15.3-alpine

USER root

RUN adduser -D -g '' lablabs
USER lablabs
WORKDIR /home/lablabs

USER root

RUN mkdir /tmp/backend && \
    mkdir /opt/runtime

COPY main_test.go main.go /tmp/backend/

WORKDIR /tmp/backend/
RUN go build  && \
    mv /tmp/backend/backend /opt/runtime/  && \
    rm -rf /tmp/backend  && \
    chown root:lablabs /opt/runtime  && \
    chmod +x /opt/runtime/backend

WORKDIR opt/runtime

USER lablabs

EXPOSE 8080

CMD [ "/opt/runtime/backend" ]

