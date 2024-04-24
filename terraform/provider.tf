provider "aws" {
  region = "us-east-1"
}

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