variable "web_acl_name" {
  description = "Name of the WAF Web ACL"
  type        = string
}

variable "rate_limit" {
  description = "Rate limit for the WAF rule"
  type        = number
}

variable "associate_with_arn" {
  description = "ARN of the resource (ALB) to associate with the WAF"
  type        = string
}
