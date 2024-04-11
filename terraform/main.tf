# Definição do provider AWS
provider "aws" {
  region = "us-east-1"
}

module "eks" {
  source = "./eks"

  cluster_name        = "easy-food-eks"
  cluster_role_arn    = var.role_aws_academy
  principal_arn       = var.principal_arn
  policy_access_arn   = var.policy_access_arn
  cluster_version     = "1.27"
  subnet_ids          = var.subnets_id
  security_group_ids  = var.security_group_ids
  access_config       = "API_AND_CONFIG_MAP"
  node_group_name     = "node-group-1"
  node_role_arn       = var.role_aws_academy
  node_subnet_ids     = var.subnets_id
  node_desired_size   = 3
  node_min_size       = 3
  node_max_size       = 5
  node_instance_types = ["t3.micro"]
}