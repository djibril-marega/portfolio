terraform {
  cloud {
    organization = "auto_action"

    workspaces {
      project = "portfolio"
      name = "test_portfolio"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92"
    }
  }

  required_version = ">= 1.2.0"
}
