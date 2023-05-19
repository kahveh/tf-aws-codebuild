variable "ecr_name" {
  type = string
}

variable "name" {
  type = string
  default = ""
}

variable "create_webhook" {
  type = bool
  default = true
}

variable "base_refs" {
  description = "List of ECR repository names"
  type        = list(string)
  default = []
}

variable "image_tag" {
  type    = string
  default = "latest"
}

variable "build_periodically" {
  type    = bool
  default = false
}

variable "source_repository" {
  type = string
}