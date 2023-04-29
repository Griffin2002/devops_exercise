variable "ami" {
  description = "AMI to use for the instance."
  type        = string
  validation {
    condition     = length(var.image_id) > 4 && substr(var.image_id, 0, 4) == "ami-"
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  }
}
variable "availability_zone" {
  description = "AZ to start the instance in."
  type        = string
}
variable "encrypted" {
  description = "Whether to enable volume encryption. Defaults to false"
  type        = bool
  default     = false
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
variable "volume_size" {
  description = "Size of the volume in gibibytes (GiB)."
  type        = number
  default     = 50
}
variable "vpc_security_group_ids" {
  description = "List of security group IDs to associate with."
  type        = list(string)
}

variable "tags" {
  description = "Map of tags to assign to the instance."
  type        = map(string)
  default     = null
}