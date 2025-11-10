# terraform-mi-proyecto

Ejemplo mínimo de proyecto Terraform con un módulo `s3_bucket` y carpeta `envs/dev`.

Quickstart:

1. Instala Terraform (>= 1.2.0).
2. Ajusta `variables` y (opcionalmente) `backend.tf` si vas a usar S3 backend.
3. Inicializa e intenta plan:

```bash
cd terraform-mi-proyecto
terraform init
terraform fmt -recursive
terraform validate
terraform plan -var-file=envs/dev/terraform.tfvars -out=tfplan
terraform apply "tfplan"
```

Notas:
- Si usas backend S3, crea el bucket y la tabla DynamoDB antes de `terraform init` o quita el `backend.tf` para usar estado local.
- No guardes claves en el repo; usa variables de entorno o profiles para autenticar con AWS.

Estado actual y ejemplo completo
--------------------------------

He añadido ejemplos y módulos para que puedas desplegar un backend mínimo (DynamoDB, Lambda y API Gateway) y un `bootstrap/` para crear el bucket S3 y la tabla DynamoDB que se usan como backend remoto.

Pasos recomendados:

1) Bootstrap (crea bucket S3 y tabla DynamoDB para el state):

```bash
make bootstrap
```

2) Empaquetar la lambda de ejemplo:

```bash
make package-lambda
```

3) Inicializar y desplegar el ejemplo (usa `envs/dev/terraform.tfvars`):

```bash
terraform init
terraform fmt -recursive
terraform validate
terraform plan -var-file=envs/dev/terraform.tfvars -out=tfplan
terraform apply "tfplan"
```

El ejemplo creado está en `examples/backend/`. Crea la lambda comprimida con `make package-lambda` antes de `plan/apply`.

Notas y consideraciones
------------------------
- Los nombres de recursos (S3) son globales; el `Makefile` crea nombres basados en el usuario para evitar colisiones, pero puedes pasar tus propios nombres en `bootstrap`.
- No incluyas credenciales en el repo. Usa `aws configure`, perfiles o variables de entorno para autenticar.
- La solución incluida es orientada a ejemplo y pruebas; para producción conviene reforzar IAM y añadir CI/CD.
