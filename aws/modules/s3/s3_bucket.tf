#---------------------------------------------------
# Create S3 bucket
#---------------------------------------------------
resource "aws_s3_bucket" "s3_bucket" {
  count = var.enable_s3_bucket ? 1 : 0

  bucket        = var.s3_bucket_name != null && var.s3_bucket_prefix == null ? lower(var.s3_bucket_name) : null
  bucket_prefix = var.s3_bucket_prefix != null && var.s3_bucket_name == null ? lower(var.s3_bucket_prefix) : null
  region        = var.region

  acl           = var.s3_bucket_acl
  policy        = var.bucket_policy != "" && ! var.enable_s3_bucket_policy ? var.bucket_policy : null
  force_destroy = var.s3_bucket_force_destroy

  dynamic "versioning" {
    for_each = var.s3_bucket_versioning
    content {
      enabled    = lookup(versioning.value, "enabled", null)
      mfa_delete = lookup(versioning.value, "mfa_delete", null)
    }
  }

  dynamic "logging" {
    for_each = var.s3_bucket_logging
    content {
      target_bucket = lookup(logging.value, "target_bucket", null)
      target_prefix = lookup(logging.value, "target_prefix", null)
    }
  }

  lifecycle_rule {
    id                                     = var.lifecycle_rule_id != "" ? var.lifecycle_rule_id : "${lower(var.name)}-lifecycle_rule-${lower(var.environment)}"
    prefix                                 = var.lifecycle_rule_prefix
    enabled                                = var.enable_lifecycle_rule
    abort_incomplete_multipart_upload_days = var.abort_incomplete_multipart_upload_days

    expiration {
      days = var.expiration_days
    }

    transition {
      days          = var.standard_transition_days
      storage_class = "STANDARD_IA" # or "ONEZONE_IA"
    }

    transition {
      days          = var.glacier_transition_days
      storage_class = "GLACIER"
    }

    noncurrent_version_expiration {
      days = var.noncurrent_version_expiration_days
    }

    noncurrent_version_transition {
      days          = var.noncurrent_version_transition_days
      storage_class = "GLACIER"
    }

    tags = merge(
      {
        "Name" = "${lower(var.name)}-lc_rule-${lower(var.environment)}"
      },
      var.tags
    )
  }

  dynamic "website" {
    for_each = var.s3_bucket_website
    content {
      index_document           = lookup(website.value, "index_document", null)
      error_document           = lookup(website.value, "error_document", null)
      redirect_all_requests_to = lookup(website.value, "redirect_all_requests_to", null)
      routing_rules            = lookup(website.value, "routing_rules", null)
    }
  }

  dynamic "cors_rule" {
    for_each = var.s3_bucket_cors_rule
    content {
      allowed_headers = lookup(cors_rule.value, "allowed_headers", null)
      allowed_methods = lookup(cors_rule.value, "allowed_methods", null)
      allowed_origins = lookup(cors_rule.value, "allowed_origins", null)
      expose_headers  = lookup(cors_rule.value, "expose_headers", null)
      max_age_seconds = lookup(cors_rule.value, "max_age_seconds", null)
    }
  }

  # dynamic "server_side_encryption_configuration" {
  #   rule {
  #     apply_server_side_encryption_by_default {
  #       kms_master_key_id = var.kms_master_key_id
  #       sse_algorithm     = var.sse_algorithm
  #     }
  #   }
  # }

  # object_lock_configuration {
  #   object_lock_enabled = var.object_lock_enabled
  #   rule {
  #     default_retention {
  #       mode  = var.default_retention_mode
  #       days  = var.default_retention_days
  #       years = var.default_retention_years
  #     }
  #   }
  # }

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