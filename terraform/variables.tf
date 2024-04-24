variable "projectName" {
  default = "easy-food"
}

variable "vpcId" {
  default = "vpc-0d7c60ea0dd8f23db"
}

variable "subnetA" {
  default = "subnet-0eadcaa4fa9230e1f"
}

variable "subnetB" {
  default = "subnet-0875a005566f2065f"
}

variable "subnetC" {
  default = "subnet-0da2aa7ea97d82204"
}

variable "labRole" {
  default = "arn:aws:iam::471112648522:role/LabRole"
}

variable "principalArn" {
  default = "arn:aws:iam::471112648522:role/voclabs"
}

variable "policyArn" {
  default = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
}

variable "clusterVersion" {
  default = "1.27"
}

variable "accessConfig" {
  default = "API_AND_CONFIG_MAP"
}

variable "instanceType" {
  default = "t3.micro"
}