provider "kubernetes" {
  host                   = aws_eks_cluster.easy-food-eks.endpoint
  cluster_ca_certificate = base64decode(aws_eks_cluster.easy-food-eks.certificate_authority[0].data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", aws_eks_cluster.easy-food-eks.name]
    command     = "aws"
  }
}

provider "helm" {
  kubernetes {
    host                   = aws_eks_cluster.easy-food-eks.endpoint
    cluster_ca_certificate = base64decode(aws_eks_cluster.easy-food-eks.certificate_authority[0].data)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", aws_eks_cluster.easy-food-eks.name]
      command     = "aws"
    }
  }
}

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
  cluster_name      = aws_eks_cluster.easy-food-eks.name
  principal_arn     = var.principal_arn
  kubernetes_groups = ["pos-tech"]
  type              = "STANDARD"
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
  instance_types  = var.node_instance_types

  scaling_config {
    desired_size = var.node_desired_size
    min_size     = var.node_min_size
    max_size     = var.node_max_size
  }

  update_config {
    max_unavailable = var.node_min_size
  }
}

# Cria namespace para o nginx ingress controller
resource "kubernetes_namespace" "nginx-ingress" {
  metadata {
    name = "nginx-ingress"
  }

  depends_on = [
    aws_eks_cluster.easy-food-eks
  ]
}

# Cria nginx ingress controller
resource "helm_release" "nginx_ingress" {
  name       = "easy-food-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  namespace  = "nginx-ingress"

  depends_on = [
    kubernetes_namespace.nginx-ingress
  ]
}