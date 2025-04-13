variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name for VPC and associated resources"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of CIDRs for public subnets"
  type        = list(string)
}

variable "public_subnet_azs" {
  description = "List of Availability Zones for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of CIDRs for private subnets"
  type        = list(string)
}

variable "private_subnet_azs" {
  description = "List of Availability Zones for private subnets"
  type        = list(string)
}

variable "sg_ingress_cidrs" {
  description = "Allowed CIDRs for security group ingress"
  type        = list(string)
}
