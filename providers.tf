terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.0.0"

  # ADD THIS BLOCK
  backend "s3" {
    bucket = "keshav-terraform-state-bucket" # Put your bucket name here
    key    = "state/terraform.tfstate"
    region = "ap-south-1"
    # Optional: dynamodb_table = "terraform-lock" (for state locking)
  }
}

provider "aws" {
  region = var.aws_region
}
