module "sqs" {
  source      = "../../modules/sqs"
  name        = "TEST"
  environment = "stage"

  # SQS queue
  enable_sqs_queue = true
  sqs_queue_name   = "test-sqs-here"

  #redrive_policy                      = file("policies/redrive_policy.json.tpl")
  sqs_dead_letter_queue_arn = "arn:aws:sqs:us-east-1:XXXXXXXXXXXX:my_sqs"
  maxReceiveCount           = 10

  # SQS queue policy
  enable_sqs_queue_policy = true
  queue_url               = ""
  sqs_queue_policy        = file("policies/sqs_queue_policy.json.tpl")

  tags = map("Env", "Dev", "managed_by", "Terraform", "App", "TestApp")
}
