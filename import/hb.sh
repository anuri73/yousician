#!/bin/bash

directory="/source/hb"
db=${SOURCE_DB}
table="hb"
files=$(find $directory -type f -name "*.csv")

clickhouseclient=(clickhouse-client --multiquery --host db -u "$APP_USER" --password "$APP_PASSWORD")

"${clickhouseclient[@]}" -q "
SET allow_experimental_object_type = 1;
create table if not exists ${db}.${table}
(
    id         Nullable(int),
    first_name Nullable(String),
    last_name  Nullable(String),
    email      Nullable(String),
    gender     Nullable(String),
    ip_address Nullable(String),
    dob        Nullable(String)
)
    engine = Memory;"

for filename in $files; do
  "${clickhouseclient[@]}" -q "
  SET allow_experimental_object_type = 1;
  SET format_csv_delimiter = ',';
  SET input_format_csv_skip_first_lines = 1;
  INSERT INTO ${db}.${table} FORMAT CSV" < $filename
done
