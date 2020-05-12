# Module: <span style="color:red"> key-pair

Terraform module which creates [Amazon EC2 key pairs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html) on AWS.

## Terraform Resources
Resource Files |
------------ |
[key-pair.tf](./key-pair.tf) |
[locals.tf](./locals.tf) |
[output.tf](./output.tf) |
[variables.tf](./variables.tf) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| resource\_name | Name that is used for resource naming | string | `"TEST"` | yes |
| enable\_key\_pair | Whether to create key pair | bool | `"false"` | no |
| key\_name | The name for the key pair | string | `n/a` | no |
| public_key | The public key material | string | n/a | yes |
| key\_name\_prefix | Creates a unique name beginning with the specified prefix. Conflicts with key_name. | string | `"key-"` | no |
| environment_name_tag | Environment name tag. Ex.: DEV, QA, STAGE, PROD | string | `TEST` | no |
| app_name_tag | APPLICATION name tag | string | `"TEST-APP-NAME"` | no |
| service_name_tag | Service name tag | string | `TEST-SERVICE-NAME` | no |

## Outputs

| Name | Description |
|------|-------------|
| aws\_key\_name | The key pair NAME |
| aws\_key\_id | The key pair ID |
| aws_key_fingerprint | MD5 public key fingerprint as specified in section 4 of RFC 4716 |

## Authors

Created and maintained by [Vadym Kudenchuk](https://github.com/VadymKo). An email: [vadym_kudenchuk@ukr.net](vadym_kudenchuk@ukr.net).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/VadymKo/terraform/blob/master/LICENSE) for full details.