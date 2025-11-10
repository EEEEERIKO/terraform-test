variable "backend_bucket_name" {
  type        = string
  description = "Name for the S3 bucket to hold Terraform state"
}

variable "lock_table_name" {
  type        = string
  description = "Name for the DynamoDB table used for state locking"
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "tags" {
  type    = map(string)
  default = {}
}
