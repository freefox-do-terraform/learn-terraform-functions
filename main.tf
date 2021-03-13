terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  backend "s3" {
     profile  = "aws-devops"
     bucket   = "terraform-state-file-devops"
     region   = "ap-southeast-2"
     key      = "aws/function/terraform.tfstate"
  }
}

provider "aws" {
  profile = "aws-devops"
  region = var.aws_region
}
