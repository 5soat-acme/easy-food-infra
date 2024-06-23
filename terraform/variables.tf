variable "projectName" {
  default = "easy-food"
}

variable "vpcId" {
  default = "vpc-04fe7720e8c600d2c"
}

variable "subnetA" {
  default = "subnet-04a3b78b67c70cd93"
}

variable "subnetB" {
  default = "subnet-090a01056a3630d47"
}

variable "subnetC" {
  default = "subnet-0358fbb4e484fdea9"
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