variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "ap-south-1"
}

# VPC variables
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "Name for the VPC and associated components"
  type        = string
  default     = "my-vpc"
}

variable "public_subnet_cidrs" {
  description = "List of CIDRs for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnet_azs" {
  description = "List of Availability Zones for public subnets"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
}

variable "private_subnet_cidrs" {
  description = "List of CIDRs for private subnets"
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "private_subnet_azs" {
  description = "List of Availability Zones for private subnets"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
}

variable "sg_ingress_cidrs" {
  description = "Allowed CIDRs for security group ingress"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

# EC2 instance variables
variable "ami_id" {
  description = "AMI ID for the EC2 instance (replace with a valid AMI in ap-south-1)"
  type        = string
  default     = "ami-xxxxxxxx"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
  default     = "my-ec2-instance"
}

variable "key_pair" {
  description = "Name of the SSH key pair to use for the instance"
  type        = string
  default     = "my-key-tf"
}

# ALB variables
variable "alb_name" {
  description = "Name for the Application Load Balancer"
  type        = string
  default     = "my-alb"
}

variable "target_group_name" {
  description = "Name for the ALB target group"
  type        = string
  default     = "my-target-group"
}

variable "target_group_protocol" {
  description = "Protocol for the ALB target group"
  type        = string
  default     = "HTTP"
}

variable "target_group_port" {
  description = "Port for the ALB target group"
  type        = number
  default     = 80
}

variable "listener_port" {
  description = "Listener port for the ALB"
  type        = number
  default     = 80
}

variable "listener_protocol" {
  description = "Listener protocol for the ALB"
  type        = string
  default     = "HTTP"
}

variable "health_check_path" {
  description = "Health check path for the ALB target group"
  type        = string
  default     = "/"
}

# WAF variables
variable "web_acl_name" {
  description = "Name of the AWS WAF Web ACL"
  type        = string
  default     = "my-web-acl"
}

variable "rate_limit" {
  description = "Rate limit threshold for the WAF rule"
  type        = number
  default     = 2000
}

# Backend variables
variable "remote_state_bucket" {
  description = "S3 bucket for remote Terraform state"
  type        = string
}

variable "remote_state_key" {
  description = "S3 key for the Terraform state file"
  type        = string
  default     = "terraform/state.tfstate"
}

variable "remote_state_dynamodb_table" {
  description = "DynamoDB table for remote state locking"
  type        = string
}
