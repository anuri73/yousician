FROM python:3.8-alpine

WORKDIR /app

ADD requirements.txt requirements.txt

RUN \
 apk add --no-cache bash && \
 apk add --no-cache --virtual .build-deps && \
 python3 -m pip install -r requirements.txt --no-cache-dir && \
 apk --purge del .build-deps

ADD . .

ENTRYPOINT ["tail", "-f", "/dev/null"]