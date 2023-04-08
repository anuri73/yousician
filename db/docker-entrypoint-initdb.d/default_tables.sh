#!/bin/bash

SOURCE_DB="${SOURCE_DB:-yousican_src}"
STG_DB="${STG_DB:-yousican_stg}"
MART_DB="${MART_DB:-yousican}"

clickhouseclient=(clickhouse-client --multiquery --host "127.0.0.1" -u "$CLICKHOUSE_USER" --password "$CLICKHOUSE_PASSWORD")

echo

if [ -n "$SOURCE_DB" ]; then
  echo "$0: create database 'SOURCE_DB'"
  "${clickhouseclient[@]}" -q "CREATE DATABASE IF NOT EXISTS $SOURCE_DB"
fi

if [ -n "$STG_DB" ]; then
  echo "$0: create database 'STG_DB'"
  "${clickhouseclient[@]}" -q "CREATE DATABASE IF NOT EXISTS $STG_DB"
fi

if [ -n "$MART_DB" ]; then
  echo "$0: create database 'MART_DB'"
  "${clickhouseclient[@]}" -q "CREATE DATABASE IF NOT EXISTS $MART_DB"
fi
