# Terraform version
terraform {
  required_version = ">= 1.6.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.31.0"
    }
    google = {
      source  = "hashicorp/google"
      version = ">= 3.50, < 5.0"
    }
  }
}