variable "projectName" {
  default = "easy-food"
}

variable "vpcId" {
  default = "vpc-0fdbfd195de9f24e2"
}

variable "subnetA" {
  default = "subnet-0a6b5b54757db7dbd"
}

variable "subnetB" {
  default = "subnet-0018d798f4bda6150"
}

variable "subnetC" {
  default = "subnet-0a6236bfdc22792b4"
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