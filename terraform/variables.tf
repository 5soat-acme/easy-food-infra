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
  default     = ["subnet-01df0985ae48e79b2", "subnet-0f314a85214500fc1", "subnet-0bca837209eae9d17"]
}

variable "security_group_ids" {
  description = "Security Groups IDs"
  type        = list(string)
  default     = ["sg-0a180dc3f1cef48d1"]
}