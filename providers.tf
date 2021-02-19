terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 2.0"
    }
  }
}
