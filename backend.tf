// Backend S3 + DynamoDB (opcional).
// Antes de usar esto, crea el bucket S3 y la tabla DynamoDB manualmente o con un bootstrap.
/*
terraform {
  backend "s3" {
    bucket         = "mi-tf-state-bucket"
    key            = "mi-proyecto/${var.environment}/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "mi-tf-lock-table"
    encrypt        = true
  }
}
*/

// Si prefieres usar estado local para comenzar, deja este archivo comentado o elimínalo.
