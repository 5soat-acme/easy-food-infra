# Definição do provider AWS
provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./vpc"

  vpc_cidr_block             = "10.0.0.0/16"
  vpc_name                   = "easy-food-vpc"
  public_subnet_cidr_blocks  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidr_blocks = ["10.0.3.0/24", "10.0.4.0/24"]
  availability_zones         = ["us-east-1a", "us-east-1b"]
}

module "eks" {
  source = "./eks"

  cluster_name        = "easy-food-eks"
  cluster_role_arn    = var.role_aws_academy
  principal_arn       = var.principal_arn
  policy_access_arn   = var.policy_access_arn
  cluster_version     = "1.27"
  subnet_ids          = concat(module.vpc.public_subnet_ids, module.vpc.private_subnet_ids)
  access_config       = "API_AND_CONFIG_MAP"
  node_group_name     = "node-group-1"
  node_role_arn       = var.role_aws_academy
  node_subnet_ids     = module.vpc.private_subnet_ids
  node_desired_size   = 3
  node_min_size       = 3
  node_max_size       = 5
  node_instance_types = ["t3.micro"]
}