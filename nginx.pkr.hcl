## These variables can be set as "Environment Variables" either on the host machine,
## or through the pipeline by setting them as PKR_VAR_aws_access_key && PKR_VAR_aws_secret_key
## with the sensitive tag set they will not be shown during the debug or any output

packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "aws_access_key" {
  type      = string
  sensitive = true
}
variable "aws_secret_key" {
  type      = string
  sensitive = true
}
##

locals {
  ami_name      = "example-nginx-ami"
  instance_type = "t2.micro"
  ssh_username  = "ubuntu"
  region        = "us-east-1"
  source_ami    = "ami-0c94855ba95c71c99" # Ubuntu 20.04 LTS
}
data "amazon-ami" "ubuntu" {
  filters = {
    "virtualization-type" = "hvm"
    "name"                = "ubuntu/images/*ubuntu-xenial-16.04-amd64-server-*"
    "root-device-type"    = "ebs"
  }
  most_recent = true
  owners      = ["099720109477"]

}

source "amazon-ebs" "ubuntu" {
  access_key    = var.aws_access_key
  secret_key    = var.secret_key
  ami_name      = local.ami_name
  instance_type = local.instance_type
  region        = local.region
  source_ami    = data.amazon-ami.ubuntu.id
  ssh_username  = local.ssh_username
  tags = {
    Name = "example-nginx"
  }
}

build {
  sources = [
    "source.amazon-ebs.ubuntu"
  ]
  provisioner "ansible" {
    playbook_file = "nginx.yml"
    on_failure    = "destroy"
  }
}
