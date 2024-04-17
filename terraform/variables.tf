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
  default     = ["subnet-03590703377fac860", "subnet-08e1e83f7a2ce4f17", "subnet-0ad1def8daf2f88ee"]
}

variable "security_group_ids" {
  description = "Security Groups IDs"
  type        = list(string)
  default     = ["sg-000935136986ff5b7"]
}