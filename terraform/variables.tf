variable "projectName" {
  default = "easy-food"
}

variable "vpcId" {
  default = "vpc-08a69779e510483fd"
}

variable "subnetA" {
  default = "subnet-08841ad6eb2e8df7a"
}

variable "subnetB" {
  default = "subnet-0857d1afd77bf9928"
}

variable "subnetC" {
  default = "subnet-0b67cee18215bd65f"
}

variable "labRole" {
  default = "arn:aws:iam::530823417496:role/LabRole"
}

variable "principalArn" {
  default = "arn:aws:iam::530823417496:role/voclabs"
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