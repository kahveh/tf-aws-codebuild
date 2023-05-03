data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_ecr_repository" "selected" {
  name = var.ecr_name
}