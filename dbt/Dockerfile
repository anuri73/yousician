FROM python:3.8-alpine

WORKDIR /app

ADD requirements.txt requirements.txt

RUN \
 apk add --no-cache bash  && \
 apk add --no-cache --virtual .build-deps libffi-dev musl-dev gcc && \
 python3 -m pip install -r requirements.txt --no-cache-dir && \
 apk --purge del .build-deps

# Install dbt dependencies (as specified in packages.yml file)
# Build seeds, models and snapshots (and run tests wherever applicable)
CMD dbt deps && dbt build --profiles-dir profiles && sleep infinitys