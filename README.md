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

## Project requirements:

- Docker
- DockerCompose
- Unix (otherwise bash utility required)

Future improvements:
- Cron task to update ip list: https://github.com/sapics/ip-location-db