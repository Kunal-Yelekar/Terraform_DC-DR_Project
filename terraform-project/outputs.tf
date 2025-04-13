output "vpc_id" {
  description = "The VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "List of public subnet IDs"
  value       = module.vpc.public_subnet_ids
}

output "private_subnets" {
  description = "List of private subnet IDs"
  value       = module.vpc.private_subnet_ids
}

output "security_group_id" {
  description = "Security Group ID"
  value       = module.vpc.security_group_id
}

output "ec2_instance_id" {
  description = "EC2 Instance ID"
  value       = module.ec2_instance.instance_id
}

output "alb_dns_name" {
  description = "DNS Name of the Application Load Balancer"
  value       = module.alb.alb_dns_name
}

output "waf_web_acl_arn" {
  description = "ARN of the WAF Web ACL"
  value       = module.waf.web_acl_arn
}
