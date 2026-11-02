aws_region = "us-east-1"

aws_vpc_name = "Atlas-VPC"
aws_vpc_cidr = "10.10.0.0/16"

aws_vpc_azs = [
  "us-east-1a",
  "us-east-1b",
  "us-east-1c"
]

aws_vpc_private_subnets = [
  "10.10.1.0/24",
  "10.10.2.0/24",
  "10.10.3.0/24"
]

aws_vpc_public_subnets = [
  "10.10.101.0/24",
  "10.10.102.0/24",
  "10.10.103.0/24"
]


aws_eks_cluster_name = "Atlas-eks-cluster"

# Utilize uma versão suportada pelo EKS
aws_eks_version = "1.33"

# Versão do módulo EKS
aws_eks_node_group_name = "eks_nodes"

aws_eks_managed_node_groups_types = {
  default = {
    desired_size = 1
    max_size     = 1
    min_size     = 1

    instance_types = ["t3.small"]

  }
}

aws_eks_managed_node_group_instance_type = "t3.small"


aws_project_tags = {
  Terraform   = "true"
  Environment = "dev"
  Project     = "Atlas"
}