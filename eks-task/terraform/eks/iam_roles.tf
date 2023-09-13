resource "aws_iam_role" "nodes-role" {
  name = "my-eks-cluster-nodes-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_policy_attachment" "node-group-role-policy-attachment-1" {
  name = "my-eks-EKSWorkerNodePolicy-attachment"
  roles      = ["my-eks-cluster-nodes-role"]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}
resource "aws_iam_policy_attachment" "node-group-role-policy-attachment-2" {
  name = "my-eks-EKS_CNI_Policy-attachment"
  roles      = ["my-eks-cluster-nodes-role"]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}
resource "aws_iam_policy_attachment" "node-group-role-policy-attachment-3" {
  name = "my-eks-EC2ContainerRegistryReadOnly-attachment"
  roles      = ["my-eks-cluster-nodes-role"]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}
