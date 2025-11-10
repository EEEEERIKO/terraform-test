resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  acl    = var.acl
  tags   = var.tags
}

resource "aws_s3_bucket_versioning" "v" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = var.versioning ? "Enabled" : "Suspended"
  }
}
