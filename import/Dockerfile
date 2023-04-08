FROM clickhouse/clickhouse-server:22.3

WORKDIR /app

COPY wwc.sh /app/wwc.sh

RUN /app/wwc.sh

ENTRYPOINT ["sleep", "infinitys"]