variable "created_by" {
  description = "Who... are you?"
  type        = string
  validation {
    condition     = can(regex("[A-Za-z]-[A-Za-z]", var.created_by))
    error_message = "Missing module author, please enter your name in a firstname-lastname format."
  }
}

variable "created_on" {
  description = "Date for when you created a resource using this module."
  type        = string
  validation {
    condition     = can(regex("[0-9]{4}-[0-9]{2}-[0-9]{2}", var.created_on))
    error_message = "Date in ISO8601, for example: 2020-12-24."
  }
}

variable "environment" {
  description = "Use to append environment to resource names."
  type        = string
  validation {
    condition     = length(var.environment) > 0
    error_message = "Environment variable is not set."
  }
}

variable "billing_account" {
  description = "Billing account ID that you want to link this project to."
  type        = string
  validation {
    condition     = can(regex("[A-Za-z0-9]{6}-[A-Za-z0-9]{6}-[A-Za-z0-9]{6}", var.billing_account))
    error_message = "Billing account ID seems to be in the wrong format, it should look like this: 123ABC-123ABC-123ABC."
  }
}

variable "folder_id" {
  description = "ID of the parent folder you want to generate this project under."
  type        = number
  validation {
    condition     = can(regex("[0-9]{12}", var.folder_id))
    error_message = "Folder ID can only contain numbers, and should be exactly 12."
  }
}

variable "project_name" {
  description = "Friendly name for project, can be changed without re-creating the project."
  type        = string
  validation {
    condition     = can(regex("([A-Za-z])(-|$)", var.project_name))
    error_message = "Project display name should only contain letters, can also be seperated by dash."
  }
}

variable "project_id_prefix" {
  description = "Leading project ID name, prefixes with fun names instead of numbers on the project ID. Warning: Changing this will re-recreate the project!"
  type        = string
  validation {
    condition     = can(regex("([A-Za-z])(-|$)", var.project_id_prefix))
    error_message = "Project ID prefix should only contain letters, can also be seperated by dash."
  }
}

variable "disable_default_service_accounts" {
  description = "Disables default service accounts that gets created by a new project, disabling this will re-enable SA's. Nifty!"
  type        = bool
  default     = true
}

variable "enabled_apis" {
  description = "List of GCP APIs to enable under the generated project."
  type        = list(string)
  default     = []
}

locals {
  labels = {
    created-with = "terraform"
    created-by   = var.created_by
    created-on   = var.created_on
    environment  = var.environment
  }
}
