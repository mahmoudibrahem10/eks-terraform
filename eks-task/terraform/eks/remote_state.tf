data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "eks-with-terraform-bucket"
    key    = "state/terraform.tfstate"
    region = "eu-central-1"
  }
}