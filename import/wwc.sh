#!/bin/bash

directory="/source/wwc"
db=${SOURCE_DB}
table="wwc"
files=$(find $directory -type f -name "*.json")

clickhouseclient=(clickhouse-client --multiquery --host db -u "$APP_USER" --password "$APP_PASSWORD")

"${clickhouseclient[@]}" -q "
SET allow_experimental_object_type = 1;
create table if not exists ${db}.${table}
(
   gender     Nullable(String),
   name       JSON,
   location   JSON,
   email      Nullable(String),
   login      JSON,
   dob        Nullable(String),
   registered Nullable(String),
   phone      Nullable(String),
   cell       Nullable(String),
   id         JSON,
   picture    JSON,
   nat        Nullable(FixedString(5))
)
   engine = Memory;"

for filename in $files; do
  "${clickhouseclient[@]}" -q "INSERT INTO ${db}.${table} FORMAT JSONEachRow" < $filename
done
