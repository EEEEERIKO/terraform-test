module "site_bucket" {
  source      = "./modules/s3_bucket"
  bucket_name = "${var.project}-${var.environment}-site"
  acl         = "private"
  tags = {
    Project     = var.project
    Environment = var.environment
  }
}
