variable "cluster_name" {
  description = "Nome do cluster EKS"
}

variable "cluster_role_arn" {
  description = "ARN da IAM role para o cluster EKS"
}

variable "principal_arn" {
  description = "Principal ARN"
}

variable "policy_access_arn" {
  description = "Política de acesso ARN"
}

variable "cluster_version" {
  description = "Versão do kubernetes para o cluster EKS"
}

variable "subnet_ids" {
  description = "IDs das subredes"
  type        = list(string)
}

variable "access_config" {
  description = "Configurações de acesso"
}


variable "node_group_name" {
  description = "Name do grupo de nós para do EKS"
}

variable "node_role_arn" {
  description = "ARN da IAM role para o grupo de nós do EKS"
}

variable "node_subnet_ids" {
  description = "IDs das subredes para o grupo de nós"
  type        = list(string)
}

variable "node_desired_size" {
  description = "Tamanho desejado de nós para o grupo de nós do EKS"
}

variable "node_min_size" {
  description = "Tamanho mínimo de nós para o grupo de nós do EKS"
}

variable "node_max_size" {
  description = "Tamanho máximo de nós para o grupo de nós do EKS"
}

variable "node_instance_types" {
  description = "Tipo de instâncias para os nós do grupo de nós do EKS"
  type        = list(string)
}