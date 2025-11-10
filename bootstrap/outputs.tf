output "backend_bucket_arn" {
  value = aws_s3_bucket.tf_state.arn
}

output "lock_table_arn" {
  value = aws_dynamodb_table.tf_locks.arn
}
