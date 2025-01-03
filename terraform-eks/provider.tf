provider "aws" {
  region = "us-west-2"  # Change this to your desired AWS region
  profile = "default"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
    }
  }
}
