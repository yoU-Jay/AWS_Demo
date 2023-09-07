terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket  = "test-s3-state"
    key     = "/terraform.tfstate"
    region  = "us-west-2"
  }
}

provider "aws" {
  region  = "us-west-2"
  profile = "jenkins"
}
