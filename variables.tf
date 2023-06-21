variable "source_repository" {
  type = string
}

variable "ecr_name" {
  description = "ECR repository name"
  type        = string
  default     = ""
}

variable "name" {
  type    = string
  default = ""
}

variable "create_webhook" {
  type    = bool
  default = true
}

variable "create_batch_configuration" {
  type    = bool
  default = false
}

variable "base_refs" {
  description = "List of ECR repository names"
  type        = list(string)
  default     = []
}

variable "build_periodically" {
  type    = bool
  default = false
}

variable "environment_variables" {
  description = "Map of environment variables for the CodeBuild project"
  type        = map(string)
  default     = {}
}

variable "description" {
  description = "Description for the CodeBuild project"
  type        = string
  default     = "Builds Docker images and pushes them to ECR"
}

variable "build_timeout" {
  description = "Build timeout for the CodeBuild project"
  type        = string
  default     = "20"
}

variable "artifact_type" {
  description = "Type of artifacts for the CodeBuild project"
  type        = string
  default     = "NO_ARTIFACTS"
}

variable "environment_compute_type" {
  description = "Compute type for the CodeBuild project environment"
  type        = string
  default     = "BUILD_GENERAL1_SMALL"
}

variable "environment_image" {
  description = "Docker image for the CodeBuild project environment"
  type        = string
  default     = "aws/codebuild/standard:5.0"
}

variable "environment_type" {
  description = "Type of environment for the CodeBuild project"
  type        = string
  default     = "LINUX_CONTAINER"
}

variable "image_pull_credentials_type" {
  description = "Image pull credentials type for the CodeBuild project"
  type        = string
  default     = "CODEBUILD"
}

variable "privileged_mode" {
  description = "Whether to enable privileged mode for the CodeBuild project"
  type        = bool
  default     = true
}

variable "cache_type" {
  description = "Cache type for the CodeBuild project"
  type        = string
  default     = "LOCAL"
}

variable "cache_modes" {
  description = "Cache modes for the CodeBuild project"
  type        = list(string)
  default     = ["LOCAL_DOCKER_LAYER_CACHE", "LOCAL_SOURCE_CACHE"]
}

variable "source_type" {
  description = "Source type for the CodeBuild project"
  type        = string
  default     = "GITHUB"
}

variable "git_clone_depth" {
  description = "Git clone depth for the CodeBuild project"
  type        = number
  default     = 1
}

variable "report_build_status" {
  description = "Whether to report build status for the CodeBuild project"
  type        = bool
  default     = true
}
