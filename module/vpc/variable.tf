variable "vpc-cidr" {
  default = "10.0.0.0/16"
}

variable "public-subnet-cidr" {
  default = "10.0.1.0/24"
}

variable "public-subnet-az" {
  default = "ap-south-1a"
}

variable "private-subnet-cidr" {
  default = "10.0.2.0/24"
}

variable "private-subnet-az" {
  default = "ap-south-1a"
}