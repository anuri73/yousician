FROM clickhouse/clickhouse-server

WORKDIR /app

COPY hb.sh /app/hb.sh
COPY wwc.sh /app/wwc.sh

RUN /app/wwc.sh

ENTRYPOINT ["sleep", "infinitys"]