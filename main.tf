

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"



  name = var.aws_vpc_name
  cidr = var.aws_vpc_cidr

  azs             = var.aws_vpc_azs
  private_subnets = var.aws_vpc_private_subnets
  public_subnets  = var.aws_vpc_public_subnets

  enable_nat_gateway = false

  enable_vpn_gateway = false


  tags = var.aws_project_tags
}

module "eks" {
  source             = "terraform-aws-modules/eks/aws"
  version            = "21.3.1"
  name               = var.aws_eks_cluster_name
  kubernetes_version = var.aws_eks_version

  enable_cluster_creator_admin_permissions = true

  subnet_ids = module.vpc.private_subnets
  vpc_id     = module.vpc.vpc_id

  endpoint_public_access = true

  eks_managed_node_groups = var.aws_eks_managed_node_groups_types
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  nullable    = false
}

variable "aws_vpc_name" {
  description = "Name of the VPC"
  type        = string
  nullable    = false
}

variable "aws_vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  nullable    = false
}

variable "aws_vpc_azs" {
  description = "Availability zones for the VPC"
  type        = set(string)
  nullable    = false
}

variable "aws_vpc_private_subnets" {
  description = "Private subnets for the VPC"
  type        = set(string)
  nullable    = false
}

variable "aws_vpc_public_subnets" {
  description = "Public subnets for the VPC"
  type        = set(string)
  nullable    = false
}

variable "aws_eks_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
  nullable    = false
}

variable "aws_eks_cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  nullable    = false
}

variable "aws_eks_node_group_name" {
  description = "Name of the EKS node group"
  type        = string
  nullable    = false
}

variable "aws_eks_managed_node_groups_types" {
  description = "Managed node groups for the EKS cluster"
  type        = map(any)
  nullable    = false
}


variable "aws_project_tags" {
  description = "Tags to apply to AWS resources"
  type        = map(any)
  nullable    = false
}


variable "aws_eks_managed_node_group_instance_type" {
  description = "Instance type for the EKS managed node group"
  type        = string
  nullable    = false
}

