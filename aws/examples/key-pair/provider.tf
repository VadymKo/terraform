terraform {
  required_version = "~> 0.12.24"
  required_providers {
    aws = "~> 2.0"
  }

  # backend "s3" {
  #   bucket = "tfstate-files"
  #   key    = "asg/dev.tfstate"
  #   region = "us-east-1"
  # }
}

provider "aws" {
  version                 = "~> 2.0"
  region                  = "us-east-1"
  shared_credentials_file = pathexpand("~/.aws/credentials")
  profile                 = "personal"
}