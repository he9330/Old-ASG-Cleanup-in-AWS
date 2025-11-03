terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    external = {
      source  = "hashicorp/external"
      version = "~> 2.0"
    }
  }
  required_version = ">= 1.6.0"
}

provider "aws" {
  region = var.region
}

module "asg_cleanup" {
  source          = "./modules/asg_cleanup"
  region          = var.region
  asg_expiry_days = var.asg_expiry_days
}
