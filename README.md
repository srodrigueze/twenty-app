# twenty-app — imagen y pipeline CI/CD de Twenty CRM

- `Dockerfile`: capa delgada sobre `twentycrm/twenty` con versión fija.
- `.github/workflows/ci.yml`: en cada **Pull Request** a `main` valida el Dockerfile (hadolint) y construye la imagen. No toca AWS.
- `.github/workflows/deploy.yml`: al hacer **merge a `main`** construye, publica en ECR, actualiza las task definitions del server y del worker en ECS, espera estabilidad y hace un smoke test a `/healthz`. Autenticación con OIDC (sin llaves).
- **Rollback:** Actions → Deploy → *Run workflow* con `rollback_sha` = SHA de una imagen ya en ECR.

Variables de repositorio necesarias: `AWS_ROLE_ARN`, `AWS_REGION`, `ECR_REPOSITORY`, `ECS_CLUSTER`, `ECS_SERVICE_SERVER`, `ECS_SERVICE_WORKER`, `APP_URL` (ver README de `twenty-iac`).

Para actualizar la versión de Twenty: cambiar `TWENTY_VERSION` en el Dockerfile mediante un PR.

> Los workflows no se han ejecutado todavía; se validó solo la sintaxis YAML y de los pasos de shell.
