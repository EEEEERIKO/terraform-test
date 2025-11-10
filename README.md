# terraform-test

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
