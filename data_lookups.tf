data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_ecr_repository" "selected" {
  name = var.ecr_name
}
data "aws_ecr_repository" "base_ref" {
  count = var.base_ref != "" ? 1 : 0
  name = var.base_ref
}