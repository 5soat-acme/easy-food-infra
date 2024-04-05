variable "role_aws_academy" {
  description = "Role"
  type        = string
  default     = "arn:aws:iam::471112648522:role/LabRole"
}

variable "principal_arn" {
  description = "Principal ARN"
  type        = string
  default     = "arn:aws:iam::471112648522:role/voclabs"
}

variable "policy_access_arn" {
  description = "Política de acesso ARN"
  type        = string
  default     = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
}