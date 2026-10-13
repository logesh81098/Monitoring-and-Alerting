variable "ami-id" {
  default = "ami-08e3b3155fc937a94"
}

variable "instance-type" {
  default = "t3.medium"
}

variable "subnet-id" {
  default = {}
}

variable "monitoring-and-alerting-sg" {
  default = {}
}

variable "monitoring-and-alerting-keyname" {
  default = {}
}

variable "monitoring-and-alerting-instance-profile" {
  default = {}
}