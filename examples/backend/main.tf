provider "aws" {
  region = var.aws_region
}

module "table" {
  source = "../../modules/dynamodb"
  name   = "${var.project}-${var.environment}-items"
  tags   = var.tags
}

module "example_lambda" {
  source        = "../../modules/lambda"
  role_name     = "${var.project}-${var.environment}-lambda-role"
  function_name = "${var.project}-${var.environment}-handler"
  lambda_zip    = var.lambda_zip
  handler       = var.handler
  runtime       = var.runtime
  environment_variables = {
    TABLE_NAME = module.table.table_name
  }
}

module "api" {
  source               = "../../modules/api_gateway"
  api_name             = "${var.project}-${var.environment}-api"
  integration_uri      = module.example_lambda.lambda_arn
  lambda_function_name = module.example_lambda.lambda_name
  stage_name           = var.stage
}

output "api_url" {
  value = module.api.api_endpoint
}
