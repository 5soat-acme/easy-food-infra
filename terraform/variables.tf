variable "projectName" {
  default = "easy-food"
}

variable "vpcId" {
  default = "vpc-0355bb719283085fc"
}

variable "subnetA" {
  default = "subnet-0483847fe525728cd"
}

variable "subnetB" {
  default = "subnet-0f0ae54221fdb697a"
}

variable "subnetC" {
  default = "subnet-04a4262ddd2c55fc4"
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