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

variable "subnets_id" {
  description = "Subnets IDs"
  type        = list(string)
  default     = ["subnet-0e1049d1e76b7ed69", "subnet-07f5f89d427187b63", "subnet-0ed2305a0ac0f800d"]
}

variable "security_group_ids" {
  description = "Security Groups IDs"
  type        = list(string)
  default     = ["sg-0abcba9c064b73cbf"]
}