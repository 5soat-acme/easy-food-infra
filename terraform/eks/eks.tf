# Definição do cluster EKS
resource "aws_eks_cluster" "easy-food-eks" {
  name     = var.cluster_name
  role_arn = var.cluster_role_arn
  version  = var.cluster_version

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  access_config {
    authentication_mode = var.access_config
  }
}

resource "aws_eks_access_entry" "access" {
    cluster_name  = aws_eks_cluster.easy-food-eks.name
    principal_arn = var.principal_arn
    kubernetes_groups = ["pos-tech"]
    type = "STANDARD"
}

resource "aws_eks_access_policy_association" "access_policy" {
    cluster_name  = aws_eks_cluster.easy-food-eks.name
    policy_arn    = var.policy_access_arn
    principal_arn = var.principal_arn
    
    access_scope {
        type = "cluster"
    }
}

# Definição do node group
resource "aws_eks_node_group" "node_group" {
  cluster_name    = aws_eks_cluster.easy-food-eks.name
  node_group_name = var.node_group_name
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.node_subnet_ids
  instance_types = var.node_instance_types

  scaling_config {
    desired_size = var.node_desired_size
    min_size     = var.node_min_size
    max_size     = var.node_max_size
  }

  update_config {
    max_unavailable = var.node_min_size
  }
}