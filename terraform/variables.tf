variable "projectName" {
  default = "easy-food"
}

variable "vpcId" {
  default = "vpc-0f7eec94b3ec3116b"
}

variable "subnetA" {
  default = "subnet-088e7724ba31b0fe0"
}

variable "subnetB" {
  default = "subnet-02936dc41f6647099"
}

variable "subnetC" {
  default = "subnet-03e7e09b1a974e2ba"
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