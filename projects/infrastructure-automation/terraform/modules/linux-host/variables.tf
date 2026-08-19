variable "hostname" {
  type        = string
  description = "Logical hostname for the infrastructure object."
}

variable "environment" {
  type        = string
  description = "Environment classification such as lab, staging or production."
}

variable "owner" {
  type        = string
  description = "Owning team or service."
}

variable "tags" {
  type        = map(string)
  description = "Additional metadata tags."
  default     = {}
}
