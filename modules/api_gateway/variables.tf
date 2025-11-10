variable "api_name" {
  type = string
}

variable "stage_name" {
  type    = string
  default = "$default"
}

variable "integration_uri" {
  type = string
}

variable "lambda_function_name" {
  type = string
}
