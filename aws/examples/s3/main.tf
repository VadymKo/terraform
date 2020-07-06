module "s3" {
  source      = "../../modules/s3"
  name        = "TEST"
  environment = "DEV"
  region      = "us-east-1"

  enable_s3_bucket = true
  s3_bucket_name   = "vadym-test-bucket"
  s3_bucket_acl    = "private"
  s3_bucket_versioning = [{
    enabled    = "true"
    mfa_delete = "false"
  }]

  # Add policy to the bucket
  enable_s3_bucket_policy = true
  s3_bucket_policy        = <<EOF
{
  "Version":"2012-10-17",
  "Statement":[
    {
      "Sid":"PublicRead",
      "Effect":"Allow",
      "Principal": "*",
      "Action":["s3:GetObject"],
      "Resource":["arn:aws:s3:::vadym-test-bucket/*"]
    }
  ]
}
EOF

  tags = map("Env", "Dev", "managed_by", "Terraform", "App", "TestApp")

}
