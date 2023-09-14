module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.29.0"

  cluster_name    = "my-eks"
  cluster_version = "1.23"

  cluster_endpoint_private_access = false
  cluster_endpoint_public_access  = true

  vpc_id     = data.terraform_remote_state.network.outputs.vpc_id
  subnet_ids = data.terraform_remote_state.network.outputs.public_subnets


  eks_managed_node_group_defaults = {
    iam_role_arn = aws_iam_role.nodes-role.arn
    disk_size = 50

    
  }

  eks_managed_node_groups = {
    general = {
      desired_size = 2
      min_size     = 2
      max_size     = 3

      labels = {
        role = "general"
      }
      ami_type       = "AL2_x86_64"
      instance_types = ["t2.micro"]
      capacity_type  = "ON_DEMAND"
    }

 
  }

  tags = {
    Environment = "staging"
  }
}