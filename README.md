## Installation:

### Simple way:
Run the following command in bash from the root directory
```bash
make install
```

### Adjustable way
1. Run the command from the root directory
```bash
make copy-env
```
2. Setup variables on your own:
```bash
POSTGRES_USER=postgres
POSTGRES_PASSWORD=FwIBtCrMYwgJYVH9BvmQxCQVxShbVRYr
APP_DB=YOUSICAN
APP_USER=yousican
APP_PASSWORD=eNjS98AGUIocPV92dsIp8Zok3xfqyDjj
```

3. Run the command from the root directory:
```bash
make install
```

## QA

1) Could you find what is the gender ratio in each game?
Yes, gender ratio per game is stored in table _yousican.gender_ratio_

2) Try to list the youngest and oldest players per country.
Yes, gender ratio per game is stored in table _yousican.hb_aggregations_ and _yousican.wwc_aggregations_

3) If you suddenly had millions of new events for the accounts to process per day, how would
   you make the data pipeline faster and more scalable and more reliable?
I am huge fan of Spark and Hadoop ecosystem. If it wasn't test assignment I would think of the following stack: Spark+Hadoop(HDFS, Parquets, hive).

Can you summarise a list of principles you would follow when developing an event pipeline?
- Scalability
- Reliability
- Auditability
- Security
- Replayability

## Project requirements:

- Docker
- DockerCompose
- Unix (otherwise bash utility required)

## Future improvements:
- Cron task to update ip list: https://github.com/sapics/ip-location-db. As for now, because of storage limitations, I've decided to prepare this table using python library [IPToCC](https://github.com/roniemartinez/IPToCC). The following command read csv file from hb.csv and enrich _ip_country.csv_ with ip address and appropriate country
```bash
  make ip-download
```
I believe that couple of GB can be allocated on production server for IP addresses, taking into account the processing speed in subsequent data marts

- Get rid of clickhouse as analytical storage system. [Clickhouse](https://clickhouse.com/docs/en/intro) was chosen, because of it's a high-performance, column-oriented SQL database management system for online analytical processing. https://clickhouse.com/docs/en/intro#why-column-oriented-databases-work-better-in-the-olap-scenario. Unfortunately, it has poor integration tool with dbt. I mean, really poor:
  - Models based on python. Currently supports only sql.
  - joins on between range. Need exact columns. Because of it, we cannot enrich our country with ip addresses from https://github.com/sapics/ip-location-db. We have to extract ip ranges and require much more storage.
  - unable to parse dates from strings with custom format. Only predefined functions.
  - It doesn't have seperated clickhouse-client docker image. That is why import container uses clickhouse/clickhouse-server.

- I am huge fan of Spark because of it's clustering and integration possibilites. And I believe, that all if this stuff could be easily refactored to Hadoop ecosystem. If there wasn't be suggestion about dbt I would definatly build it on top of Hadoop/Spark ecosystem.