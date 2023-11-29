module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "jenkins-vpc"
  cidr = var.vpc_cidr

  azs = data.aws_availability_zones.azs.names

  #private_subnets = var.private_subnets
  public_subnets = var.public_subnets

  enable_dns_hostnames = true

  tags = {
    Name        = "jenkins-vpc"
    Terraform   = "true"
    Environment = "dev"
  }

  public_subnet_tags = {
    Name = "jenkins-subnet"
  }
  
  #enable_nat_gateway   = true
  #single_nat_gateway   = true

  #SG
#   module "sg" {
#   source = "terraform-aws-modules/security-group/aws"

#   name        = "jenkins-sg"
#   description = "Security Group for Jenkins Server"
#   vpc_id      = module.vpc.default_vpc_id
  
#   ingress_with_cidr_blocks = [
#     {
#       from_port   = 8080
#       to_port     = 8080
#       protocol    = "tcp"
#       description = "HTTP"
#       cidr_blocks = "0.0.0.0/0"
#     },
#     {
#       from_port   = 22
#       to_port     = 22
#       protocol    = "tcp"
#       description = "SSH"
#       cidr_blocks = "0.0.0.0/0"
#     }      
#   ]

#   egress_with_cidr_blocks = [
#     {
#       from_port   = 0
#       to_port     = 0
#       protocol    = "-1"
#       cidr_blocks = "0.0.0.0/0"
#     }

#   ]
# }

  # tags = {
  #   "kubernetes.io/cluster/my-eks-cluster" = "shared"
  # }

  # public_subnet_tags = {
  #   "kubernetes.io/cluster/my-eks-cluster" = "shared"
  #   "kubernetes.io/role/elb"               = 1
  # }

  # private_subnet_tags = {
  #   "kubernetes.io/cluster/my-eks-cluster" = "shared"
  #   "kubernetes.io/role/internal-elb"      = 1
  # }

}

# module "eks" {
#   source = "terraform-aws-modules/eks/aws"

#   cluster_name    = "my-eks-cluster"
#   cluster_version = "1.24"

#   cluster_endpoint_public_access = true

#   vpc_id     = module.vpc.vpc_id
#   subnet_ids = module.vpc.private_subnets

#   eks_managed_node_groups = {
#     nodes = {
#       min_size     = 1
#       max_size     = 3
#       desired_size = 2

#       instance_type = ["t2.small"]
#     }
#   }

#   tags = {
#     Environment = "dev"
#     Terraform   = "true"
#   }
# }