##############################################################################################################################
#                                             VPC
##############################################################################################################################

resource "aws_vpc" "monitoring-vpc" {
    cidr_block = var.vpc-cidr
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = {
        Name = "Monitoring and Alerting"
        IAC = "Terraform"
    }
}


##############################################################################################################################
#                                           VPC Subnets
##############################################################################################################################

resource "aws_subnet" "monitoring-public-subnet" {
    vpc_id = aws_vpc.monitoring-vpc.id
    cidr_block = var.public-subnet-cidr
    availability_zone = var.public-subnet-az
    tags = {
        Name = "Monitoring and Alerting Public Subnet"
        IAC = "Terraform"
    }
}

resource "aws_subnet" "monitoring-private-subnet" {
    vpc_id = aws_vpc.monitoring-vpc.id
    cidr_block = var.private-subnet-cidr
    availability_zone = var.private-subnet-az
    tags = {
        Name = "Monitoring and Alerting Private Subnet"
        IAC = "Terraform"
    }
}