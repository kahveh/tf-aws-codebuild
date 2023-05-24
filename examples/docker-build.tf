data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

variable "image_tag" {
  description = "Image tag for the Docker build"
  type        = string
  default     = "latest"
}

module "docker-build" {
  source = "../"

  environment_variables = {
    "AWS_DEFAULT_REGION" = data.aws_region.current.name
    "AWS_ACCOUNT_ID"     = data.aws_caller_identity.current.account_id
    "ECR_REPOSITORY"     = "my-ecr-repo"
    "IMAGE_TAG"          = var.image_tag
  }

  source_repository = "git@github.com/test/docker-repo"
}