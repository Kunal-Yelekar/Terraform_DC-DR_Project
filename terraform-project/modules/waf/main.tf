resource "aws_wafv2_web_acl" "this" {
  name        = var.web_acl_name
  scope       = "REGIONAL"
  description = "WAF to protect the ALB"
  
  default_action {
    allow {}
  }
  
  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = var.web_acl_name
    sampled_requests_enabled   = true
  }
  
  rule {
    name     = "RateLimitRule"
    priority = 1
    action {
      block {}
    }
    statement {
      rate_based_statement {
        limit              = var.rate_limit
        aggregate_key_type = "IP"
      }
    }
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "RateLimitRule"
      sampled_requests_enabled   = true
    }
  }
}

resource "aws_wafv2_web_acl_association" "this" {
  resource_arn = var.associate_with_arn
  web_acl_arn  = aws_wafv2_web_acl.this.arn
}
