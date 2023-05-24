data "aws_ecr_repository" "selected" {
  count = var.ecr_name != "" ? 1 : 0
  name  = var.ecr_name
}

data "aws_ecr_repository" "base_ref" {
  count = length(var.base_refs) > 0 ? length(var.base_refs) : 0
  name  = var.base_refs[count.index]
}
