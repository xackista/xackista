terraform {
  required_version = ">= 1.5.0"
}

locals {
  standard_tags = {
    Name        = var.hostname
    Environment = var.environment
    Owner       = var.owner
    ManagedBy   = "Terraform"
  }
}

output "metadata" {
  value = merge(local.standard_tags, var.tags)
}
