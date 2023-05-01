data "aws_ami" "example" {
  most_recent = true
  name_regex  = "^example-nginx-ami"
  owners      = ["self"]

  filter {
    name   = "name"
    values = ["example-nginx-ami"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
resource "aws_instance" "webhost" {
  ami                    = data.aws_ami.example.id
  availability_zone      = var.availability_zone
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_id
  root_block_device {
    delete_on_termination = true
    encrypted             = var.encrypted
    volume_size           = var.volume_size
  }
  tags = var.tags
} 