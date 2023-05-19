locals {
  codebuild_project_name = var.name != "" ? var.name : "docker-build"
}

resource "aws_codebuild_project" "docker_build" {
  name          = local.codebuild_project_name
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
      name  = "AWS_DEFAULT_REGION"
      value = data.aws_region.current.name
    }

    environment_variable {
      name  = "AWS_ACCOUNT_ID"
      value = data.aws_caller_identity.current.account_id
    }

    environment_variable {
      name  = "ECR_REPOSITORY"
      value = data.aws_ecr_repository.selected.repository_url
    }

    environment_variable {
      name  = "IMAGE_TAG"
      value = var.image_tag
    }
  }

  cache {
    type = "LOCAL"
    modes = ["LOCAL_DOCKER_LAYER_CACHE", "LOCAL_SOURCE_CACHE"]
  }
  
  source {
    type            = "GITHUB"
    location        = var.source_repository
    git_clone_depth = 1
    report_build_status = true
  }
}

resource "aws_codebuild_webhook" "webhook" {
  count = var.create_webhook ? 1 : 0
  project_name = aws_codebuild_project.docker_build.name
  build_type = "BUILD"
  filter_group {
    filter {
      type = "EVENT"
      pattern = "PUSH"
    }
  }
}