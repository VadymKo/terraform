module "s3" {
  source      = "../../modules/s3"
  name        = "TEST"
  environment = "DEV"
  region      = "us-east-1"

  enable_s3_bucket = true
  s3_bucket_name   = "vadym-test-bucket"
  s3_bucket_acl    = "log-delivery-write" # "private" - default acl, "log-delivery-write" - acl for logging enabled

  s3_bucket_versioning = [{
    enabled    = "true"
    mfa_delete = "false"
  }]

  s3_bucket_logging = [{
    target_bucket = "vadym-test-bucket"
    target_prefix = "logging"
  }]

  #   s3_bucket_website = [{
  #     index_document = "index.html"
  #     error_document = "error.html"
  #     routing_rules  = <<EOF
  # [{
  #     "Condition": {
  #         "KeyPrefixEquals": "docs/"
  #     },
  #     "Redirect": {
  #         "ReplaceKeyPrefixWith": "documents/"
  #     }
  # }]
  # EOF
  #   }]

  s3_bucket_cors_rule = [{
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST"]
    allowed_origins = ["https://s3-website-test.hashicorp.com"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }]

  # Add a configuration of object lifecycle management
  enable_lifecycle_rule = true

  # Add object_lock
  # object_lock_enabled    = "Enabled"
  # default_retention_mode = "GOVERNANCE" # Valid values are GOVERNANCE and COMPLIANCE
  # default_retention_days = 10

  # Add policy to the bucket
  #   enable_s3_bucket_policy = true
  #   s3_bucket_policy        = <<EOF
  # {
  #   "Version":"2012-10-17",
  #   "Statement":[
  #     {
  #       "Sid":"PublicRead",
  #       "Effect":"Allow",
  #       "Principal": "*",
  #       "Action":["s3:GetObject"],
  #       "Resource":["arn:aws:s3:::vadym-test-bucket/*"]
  #     }
  #   ]
  # }
  # EOF

  tags = map("Env", "Dev", "managed_by", "Terraform", "App", "TestApp")

}
