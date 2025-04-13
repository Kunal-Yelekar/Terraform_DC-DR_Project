terraform {
  backend "s3" {
    bucket         = var.remote_state_bucket
    key            = var.remote_state_key
    region         = var.aws_region
    dynamodb_table = var.remote_state_dynamodb_table
  }
}
