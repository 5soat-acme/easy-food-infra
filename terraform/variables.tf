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
  default     = ["subnet-040f6c75e5705ef7f", "subnet-0b7b2415e7e3be5e9", "subnet-09c3f8f93727d0e40"]
}

variable "security_group_ids" {
  description = "Security Groups IDs"
  type        = list(string)
  default     = ["sg-02185146b549f752f"]
}