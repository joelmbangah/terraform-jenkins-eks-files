terraform {
  backend "s3" {
    bucket = "cicd-terraform-eks-bucket"
    key    = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}