FROM alpine:latest

RUN apk update
RUN apk add curl jq openjdk17-jre

WORKDIR /paper/
ADD ./start.sh /start.sh

ENTRYPOINT ["sh", "/start.sh"]
