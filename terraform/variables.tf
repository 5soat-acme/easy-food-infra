variable "projectName" {
  default = "easy-food"
}

variable "vpcId" {
  default = "vpc-0b487ce478bbfd0e7"
}

variable "subnetA" {
  default = "subnet-02d666d6425af6722"
}

variable "subnetB" {
  default = "subnet-05197ae35fa1c7bab"
}

variable "subnetC" {
  default = "subnet-07a778975c3b70443"
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