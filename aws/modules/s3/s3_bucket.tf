#---------------------------------------------------
# Create S3 bucket
#---------------------------------------------------
resource "aws_s3_bucket" "s3_bucket" {
  count = var.enable_s3_bucket ? 1 : 0

  bucket        = var.s3_bucket_name != null && var.s3_bucket_prefix == null ? lower(var.s3_bucket_name) : null
  bucket_prefix = var.s3_bucket_prefix != null && var.s3_bucket_name == null ? lower(var.s3_bucket_prefix) : null
  region        = var.region

  acl    = var.s3_bucket_acl
  policy = var.bucket_policy != "" && ! var.enable_s3_bucket_policy ? var.bucket_policy : null

  dynamic "versioning" {
    for_each = var.s3_bucket_versioning
    content {
      enabled    = lookup(versioning.value, "enabled", null)
      mfa_delete = lookup(versioning.value, "mfa_delete", null)
    }
  }

  tags = merge(
    {
      "Name" = var.s3_bucket_name != null && var.s3_bucket_prefix == null ? lower(var.s3_bucket_name) : lower(var.s3_bucket_prefix)
    },
    var.tags
  )

  lifecycle {
    create_before_destroy = true
    ignore_changes        = []
  }

  depends_on = []
}