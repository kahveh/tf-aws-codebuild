resource "aws_codebuild_project" "docker_build" {
  name          = "docker-build"
  description   = "Builds Docker images and pushes them to ECR"
  build_timeout = "20"
  service_role  = aws_iam_role.codebuild_role.arn

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:5.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = true

    environment_variable {
      name  = "ECR_REPOSITORY"
      value = data.aws_ecr_repository.selected.repository_url
    }

    environment_variable {
      name  = "IMAGE_TAG"
      value = var.image_tag
    }
  }

  source {
    type            = "GITHUB"
    location        = var.source_repository
    git_clone_depth = 1
  }
}
