# Module: <span style="color:red"> aws_sqs

Terraform module which creates [Amazon SQS](https://aws.amazon.com/sqs/) on AWS.

## Terraform Resources
Resource Files |
------------ |
[sqs_queue.tf](./sqs_queue.tf) |
[sqs_queue_policy.tf](./sqs_queue_policy.tf) |
[output.tf](./output.tf) |
[variables.tf](./variables.tf) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name | Name that is used for resource naming | string | `"TEST"` | yes |
| environment | Environment for service | string | `"STAGE"` | no |
| tags | Environment for service | string | `"STAGE"` | no |
| environment | A list of tag blocks. Each element should have keys named key, value, etc. | map(string) | `"{}"` | no |
| enable\_sqs\_queue | Enable SQS queue usage | bool | `"false"` | no |
| sqs\_queue\_name | The queue_name description | string | `n/a` | no |
| key\_name\_prefix | Creates a unique name beginning with the specified prefix. Conflicts with key_name. | string | `n/a` | no |
| delay\_seconds | The time in seconds that the delivery of all messages in the queue will be delayed. An integer from 0 to 900 (15 minutes). The default for this attribute is 0 seconds. | number | `90` | no |
| max\_message\_size | The limit of how many bytes a message can contain before Amazon SQS rejects it. An integer from 1024 bytes (1 KiB) up to 262144 bytes (256 KiB). The default for this attribute is 262144 (256 KiB). | number | `2048` | no |
| message\_retention\_seconds | The number of seconds Amazon SQS retains a message. Integer representing seconds, from 60 (1 minute) to 1209600 (14 days). The default for this attribute is 345600 (4 days). | number | `86400` | no |
| receive\_wait\_time\_seconds | The time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning. An integer from 0 to 20 (seconds). The default for this attribute is 0, meaning that the call will return immediately. | number | `10` | no |
| fifo\_queue | Boolean designating a FIFO queue. If not set, it defaults to false making it standard. | bool | `false` | no |
| content\_based\_deduplication | Enables content-based deduplication for FIFO queues. | bool | `false` | no |
| kms\_master\_key\_id | The ID of an AWS-managed customer master key (CMK) for Amazon SQS or a custom CMK. | string | `alias/aws/sqs` | no |
| kms\_data\_key\_reuse\_period\_seconds | The length of time, in seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt messages before calling AWS KMS again. An integer representing seconds, between 60 seconds (1 minute) and 86,400 seconds (24 hours). The default is 300 (5 minutes). | number | `300` | no |
| maxReceiveCount | Value for redrive_policy (set maxReceiveCount for dead_letter_queue) | number | `10` | no |
| sqs_dead_letter_queue_arn | Set sqs arn for dead_letter_queue | number | `0` | no |
| visibility_timeout_seconds | The timeout in seconds of visibility of the message | number | `30` | no |
| sqs_queue_policy | (Optional) The JSON policy for the SQS queue. For more information about building AWS IAM policy documents with Terraform | string | `null` | no |
| enable_sqs_queue_policy | Enable SQS queue policy | bool | `false` | no |
| queue_url | The URL of the SQS Queue to which to attach the policy | string | `n/a` | yes |

## Outputs

| Name | Description |
|------|-------------|
| sqs\_queue\_arn | The URL for the created Amazon SQS queue. |
| sqs\_queue\_id | The ARN of the SQS queue |

## Authors

Created and maintained by [Vadym Kudenchuk](https://github.com/VadymKo). An email: [vadym_kudenchuk@ukr.net](vadym_kudenchuk@ukr.net).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/VadymKo/terraform/blob/master/LICENSE) for full details.