variable "environment" {}

variable "created_by" {}

variable "created_on" {}

variable "project" {}

variable "location" {}

variable "name" {
  type = string
}

locals {
  location = var.location
  labels = {
    created-with = "terraform"
    created-by   = var.created_by
    created-on   = var.created_on
    environment  = var.environment
  }
}
