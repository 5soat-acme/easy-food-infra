variable "projectName" {
  default = "easy-food"
}

variable "vpcId" {
  default = "vpc-07223788ed181ad75"
}

variable "subnetA" {
  default = "subnet-0bd31d5327ec7d01c"
}

variable "subnetB" {
  default = "subnet-0cc66a78870120308"
}

variable "subnetC" {
  default = "subnet-015d349d564a356a6"
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