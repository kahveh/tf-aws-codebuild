locals {
  build_periodically = var.build_periodically ? 1 : 0
}

resource "aws_cloudwatch_event_rule" "nightly_build" {
  count               = local.build_periodically
  name                = "nightly-${local.codebuild_project_name}-build"
  description         = "Triggers the CodeBuild project to build and push ${local.codebuild_project_name} images nightly"
  schedule_expression = "cron(0 0 * * ? *)" # Triggered nightly at midnight
}

resource "aws_cloudwatch_event_target" "nightly_build_target" {
  count     = local.build_periodically
  rule      = aws_cloudwatch_event_rule.nightly_build[0].name
  arn       = aws_codebuild_project.docker_build.arn
  target_id = "NightlyDockerBuild"
}