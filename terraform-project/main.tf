module "vpc" {
  source               = "./modules/vpc"
  cidr_block           = var.vpc_cidr
  vpc_name             = var.vpc_name
  public_subnet_cidrs  = var.public_subnet_cidrs
  public_subnet_azs    = var.public_subnet_azs
  private_subnet_cidrs = var.private_subnet_cidrs
  private_subnet_azs   = var.private_subnet_azs
  sg_ingress_cidrs     = var.sg_ingress_cidrs
}

module "ec2_instance" {
  source            = "./modules/ec2-instance"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  # Launch the EC2 instance in the first private subnet
  subnet_id         = module.vpc.private_subnet_ids[0]
  security_group_id = module.vpc.security_group_id
  instance_name     = var.instance_name
  key_pair          = var.key_pair
}

module "alb" {
  source                = "./modules/alb"
  alb_name              = var.alb_name
  alb_security_group_id = module.vpc.security_group_id
  public_subnets        = module.vpc.public_subnet_ids
  vpc_id                = module.vpc.vpc_id
  target_group_name     = var.target_group_name
  target_group_protocol = var.target_group_protocol
  target_group_port     = var.target_group_port
  listener_port         = var.listener_port
  listener_protocol     = var.listener_protocol
  health_check_path     = var.health_check_path
  instance_id           = module.ec2_instance.instance_id
}

module "waf" {
  source             = "./modules/waf"
  web_acl_name       = var.web_acl_name
  rate_limit         = var.rate_limit
  associate_with_arn = module.alb.alb_arn
}
