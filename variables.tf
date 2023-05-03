variable "ecr_arn" {
  type = string
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