# Define Local Values in Terraform
locals {
  owners = var.department
  environment = var.environment
  name = "${var.department}-${var.environment}"

  common_tags = {
    owners = locals.owners
    environment = locals.environment
  }
}