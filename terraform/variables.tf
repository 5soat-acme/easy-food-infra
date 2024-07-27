variable "projectName" {
  default = "easy-food"
}

variable "vpcId" {
  default = "vpc-0ce5c691d8d8ff7c6"
}

variable "subnetA" {
  default = "subnet-05aad02e65384db47"
}

variable "subnetB" {
  default = "subnet-026eeaede5d110429"
}

variable "subnetC" {
  default = "subnet-0b91af24d5266660b"
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