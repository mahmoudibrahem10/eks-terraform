module "vpc" {
  source         = "terraform-aws-modules/vpc/aws"
  version        = "3.18.1"
  name           = "eks-vpc"
  cidr           = "10.0.0.0/16"
  azs            = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets =["10.0.100.0/24", "10.0.101.0/24"]
  tags = {
    "env"       = "stage"
  }

}

data "aws_vpc" "main" {
  id = module.vpc.vpc_id
}