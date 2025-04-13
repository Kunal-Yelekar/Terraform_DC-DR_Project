variable "alb_name" {
  description = "Name of the ALB"
  type        = string
}

variable "alb_security_group_id" {
  description = "Security group for the ALB"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet IDs for the ALB"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "target_group_name" {
  description = "Name of the target group"
  type        = string
}

variable "target_group_protocol" {
  description = "Protocol for the target group"
  type        = string
}

variable "target_group_port" {
  description = "Port for the target group"
  type        = number
}

variable "listener_port" {
  description = "Port for the ALB listener"
  type        = number
}

variable "listener_protocol" {
  description = "Protocol for the ALB listener"
  type        = string
}

variable "health_check_path" {
  description = "Health check path for the target group"
  type        = string
}

variable "instance_id" {
  description = "EC2 instance ID to register in the target group"
  type        = string
}
