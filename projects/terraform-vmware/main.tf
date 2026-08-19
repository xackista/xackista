terraform {
  required_version = ">= 1.6.0"
  required_providers {
    vsphere = {
      source = "vmware/vsphere"
      version = "~> 2.8"
    }
  }
}
provider "vsphere" {
  user = var.vsphere_user
  password = var.vsphere_password
  vsphere_server = var.vsphere_server
  allow_unverified_ssl = true
}
variable "vsphere_server" { type = string }
variable "vsphere_user" { type = string }
variable "vsphere_password" { type = string, sensitive = true }
