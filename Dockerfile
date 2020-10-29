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

RUN mkdir /tmp/backend
RUN mkdir /opt/runtime

COPY main_test.go main.go /tmp/backend/

WORKDIR /tmp/backend/
RUN go build
RUN mv /tmp/backend/backend /opt/runtime/
RUN chown root:lablabs /opt/runtime
RUN chmod +x /opt/runtime/backend

WORKDIR opt/runtime

USER lablabs

EXPOSE 8080

CMD [ "/opt/runtime/backend" ]

