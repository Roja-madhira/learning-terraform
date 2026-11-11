terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.70.0"
    }
  }

  backend "s3" {
    bucket       = "remote-state-roja92s"
    key          = "workspaces.tfstate-dev"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}

provider "aws" {
  region = "us-east-1"
}