## DevOps Exercise
Infrastructure
For this project, please think about how you would architect a scalable and secure static web
application in AWS.
- Create and deploy a running instance of a web server using a configuration management
tool of your choice. The web server should serve one page with the following content.
```
<html>
<head>
<title>Hello World</title>
</head>
<body>
<h1>Hello World!</h1>
</body>
</html>
```
- Secure this application and host such that only appropriate ports are publicly exposed and
any http requests are redirected to https. This should be automated using a configuration
management tool of your choice and you should feel free to use a self-signed certificate for
the web server.
- Develop and apply automated tests to validate the correctness of the server configuration.
- Express everything in code.

### Justification
This module craeate an Amazon Machine Image (AMI) with the use of HashCorp Packer and Ansible.  The image
is set up to add nginx to the image and add the nginx configuration to the image.  Then Terraform uses
this image to create the webserver and exports the public ip as a result.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_amazon-ami"></a> [amazon-ami](#provider\_amazon-ami) | n/a |
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.65.0 |

The following information needs to be provided to the module in order for it to run

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | AZ to start the instance in. | `string` | n/a | yes |
| <a name="input_aws_access_key"></a> [aws\_access\_key](#input\_aws\_access\_key) | n/a | `string` | n/a | yes |
| <a name="input_aws_secret_key"></a> [aws\_secret\_key](#input\_aws\_secret\_key) | n/a | `string` | n/a | yes |
| <a name="input_encrypted"></a> [encrypted](#input\_encrypted) | Whether to enable volume encryption. Defaults to false | `bool` | `false` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Instance type to use for the instance. | `string` | `"t2.micro"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | Key name of the Key Pair to use for the instance | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | VPC Subnet ID to launch in. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of tags to assign to the instance. | `map(string)` | `null` | no |
| <a name="input_volume_size"></a> [volume\_size](#input\_volume\_size) | Size of the volume in gibibytes (GiB). | `number` | `50` | no |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | List of security group IDs to associate with. | `list(string)` | n/a | yes |

The following information will be provided when terraform completes

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | Public IP address assigned to the instance |
