variable "project" {
  type        = string
  description = "Nombre del proyecto"
  default     = "mi-proyecto"
}

variable "environment" {
  type        = string
  description = "Entorno (dev/prod)"
  default     = "dev"
}

variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}
