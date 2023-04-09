FROM python:3.8

WORKDIR /app

ADD requirements.txt requirements.txt

RUN python3 -m pip install -r requirements.txt --no-cache-dir

ENV DBT_PROFILES_DIR "/app/profiles"

# Install dbt dependencies (as specified in packages.yml file)
# Build seeds, models and snapshots (and run tests wherever applicable)
CMD dbt deps && dbt build --profiles-dir profiles && sleep infinitys