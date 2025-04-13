variable "ami_id" {
  description = "AMI ID for the instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID to launch the instance in"
  type        = string
}

variable "security_group_id" {
  description = "Security Group ID for the instance"
  type        = string
}

variable "instance_name" {
  description = "Name tag for the instance"
  type        = string
}

variable "key_pair" {
  description = "SSH key pair name"
  type        = string
}
