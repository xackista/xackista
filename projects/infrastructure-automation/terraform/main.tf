terraform {
  required_version = ">= 1.5.0"
}

# Provider configuration is intentionally omitted so this portfolio can be
# adapted to VMware, libvirt, cloud or another supported platform.

variable "environment" {
  type    = string
  default = "lab"
}

locals {
  common_tags = {
    Environment = var.environment
    ManagedBy   = "terraform"
    Portfolio   = "enterprise-infrastructure"
  }
}

output "environment" {
  value = var.environment
}

output "common_tags" {
  value = local.common_tags
}
