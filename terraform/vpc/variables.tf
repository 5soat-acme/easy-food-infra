variable "vpc_cidr_block" {
  description = "CIDR para a VPC"
}

variable "vpc_name" {
  description = "Nome da VPC"
}

variable "public_subnet_cidr_blocks" {
  description = "CIDR para as subredes públicas"
  type        = list(string)
}

variable "private_subnet_cidr_blocks" {
  description = "CIDR para as subredes privadas"
  type        = list(string)
}

variable "availability_zones" {
  description = "Zonas de disponibilidade para as subredes"
  type        = list(string)
}