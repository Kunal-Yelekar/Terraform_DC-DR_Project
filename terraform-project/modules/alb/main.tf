resource "aws_lb" "this" {
  name               = var.alb_name
  load_balancer_type = "application"
  security_groups    = [ var.alb_security_group_id ]
  subnets            = var.public_subnets
  tags = {
    Name = var.alb_name
  }
}

resource "aws_lb_target_group" "this" {
  name     = var.target_group_name
  port     = var.target_group_port
  protocol = var.target_group_protocol
  vpc_id   = var.vpc_id

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 3
    interval            = 30
    timeout             = 5
    protocol            = var.target_group_protocol
    path                = var.health_check_path
  }
  
  tags = {
    Name = var.target_group_name
  }
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port              = var.listener_port
  protocol          = var.listener_protocol
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

resource "aws_lb_target_group_attachment" "attachment" {
  target_group_arn = aws_lb_target_group.this.arn
  target_id        = var.instance_id
  port             = var.target_group_port
}
