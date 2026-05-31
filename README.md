# Hello World + Config Server

Simple demo: **Hello World** message with `name1` loaded from Spring Cloud Config Server.

| Application | Port |
|-------------|------|
| Config Server | 8090 |
| Hello App | 8091 |

## Run

**Option 1 — start both:**
```bat
start-all.bat
```

**Option 2 — manual (2 terminals):**
```bat
cd config-server
mvn spring-boot:run

cd hello-app
mvn spring-boot:run
```

Start **config-server first**, then **hello-app**.

## Test

```text
GET http://localhost:8091/
GET http://localhost:8091/hello
```

Response:
```text
Hello World Om Gupta
```

## Change name1

Edit `config-repo/hello-app.yml`:
```yaml
name1: Your Name
```

Restart hello-app (or call `POST http://localhost:8091/actuator/refresh` if refresh is enabled).

Verify config:
```text
GET http://localhost:8090/hello-app/default
```

## GitHub

Repo: https://github.com/omgupta210/Spring_boot_microservice
