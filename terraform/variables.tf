variable "projectName" {
  default = "easy-food"
}

variable "vpcId" {
  default = "vpc-04e26113b3b02f22d"
}

variable "subnetA" {
  default = "subnet-087a10e0630cd7b12"
}

variable "subnetB" {
  default = "subnet-0200e231b77ca2b10"
}

variable "subnetC" {
  default = "subnet-0a692ec9c340fcade"
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