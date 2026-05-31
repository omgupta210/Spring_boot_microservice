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

## Deploy to Git (GitHub: omgupta210)

1. Install Git: https://git-scm.com/download/win
2. Create repo: https://github.com/new → name **`spring-server-code`** (no README)
3. Run:
```bat
cd D:\spring_server_code
deploy-to-git.bat
```

Or manually:
```bat
cd D:\spring_server_code
git init
git add .
git commit -m "Initial commit: Hello World + Config Server"
git branch -M main
git remote add origin https://github.com/omgupta210/spring-server-code.git
git push -u origin main
```

Repo URL: https://github.com/omgupta210/spring-server-code
