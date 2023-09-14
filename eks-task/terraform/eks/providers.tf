provider "aws" {
  region     = var.aws_region
  version = "~> 3.73.0"
}


terraform {
  backend "s3" {
    bucket = "eks-with-terraform-bucket"
    key    = "state/terraform-eks.tfstate"
    region = "eu-central-1"
  }
}