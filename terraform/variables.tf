variable "projectName" {
  default = "easy-food"
}

variable "vpcId" {
  default = "vpc-0525b6028935ec0bf"
}

variable "subnetA" {
  default = "subnet-0f9a83996fc46f8ee"
}

variable "subnetB" {
  default = "subnet-021a4b1a51db2da95"
}

variable "subnetC" {
  default = "subnet-083423d14d81de52e"
}

variable "labRole" {
  default = "arn:aws:iam::610659164388:role/LabRole"
}

variable "principalArn" {
  default = "arn:aws:iam::610659164388:role/voclabs"
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