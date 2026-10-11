variable "vpc-id" {
  default = {}
}

variable "my-public-ip" {
  default = "49.37.206.191/32"
}

variable "ssh-port" {
  default = "22"
}

variable "grafana-port" {
  default = "3000"
}

variable "anywhere-ip" {
  default = "0.0.0.0/0"
}