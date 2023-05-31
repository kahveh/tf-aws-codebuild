locals {
  codebuild_project_name = var.name != "" ? var.name : "code-build"
}

resource "aws_codebuild_project" "code_build" {
  name          = local.codebuild_project_name
  description   = var.description
  build_timeout = var.build_timeout
  service_role  = aws_iam_role.codebuild_role.arn

  artifacts {
    type = var.artifact_type
  }

  environment {
    compute_type                = var.environment_compute_type
    image                       = var.environment_image
    type                        = var.environment_type
    image_pull_credentials_type = var.image_pull_credentials_type
    privileged_mode             = var.privileged_mode

    dynamic "environment_variable" {
      for_each = var.environment_variables
      content {
        name  = environment_variable.key
        value = environment_variable.value
      }
    }
  }

  cache {
    type  = var.cache_type
    modes = var.cache_modes
  }

  source {
    type                = var.source_type
    location            = var.source_repository
    git_clone_depth     = var.git_clone_depth
    report_build_status = var.report_build_status
  }
}

resource "aws_codebuild_webhook" "webhook" {
  count        = var.create_webhook ? 1 : 0
  project_name = aws_codebuild_project.code_build.name
  build_type   = "BUILD"
  filter_group {
    filter {
      type    = "EVENT"
      pattern = "PUSH"
    }
  }
}