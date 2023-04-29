variable "ami" {
  description = "AMI to use for the instance."
  type        = string
  validation {
    condition     = length(var.image_id) > 4 && substr(var.image_id, 0, 4) == "ami-"
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  }
}
variable "instance_type" {
  description = "Instance type to use for the instance."
  type        = string
  default     = "t2.micro"
}
variable "key_name" {
  description = "Key name of the Key Pair to use for the instance"
  type        = string
}
variable "subnet_id" {
  description = "VPC Subnet ID to launch in."
  type        = string
}
variable "vpc_security_group_ids" {
  description = "List of security group IDs to associate with."
  type        = list(string)
}

variable "tags" {
  description = "Map of tags to assign to the device."
  type        = map(string)
}