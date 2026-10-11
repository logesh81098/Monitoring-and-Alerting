##############################################################################################################################
#                                                VPC
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
#                                             VPC Subnets
##############################################################################################################################

resource "aws_subnet" "monitoring-public-subnet" {
    vpc_id = aws_vpc.monitoring-vpc.id
    map_public_ip_on_launch = true
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



##############################################################################################################################
#                                             VPC Route Tables
##############################################################################################################################

resource "aws_route_table" "monitoring-public-routetable" {
  vpc_id = aws_vpc.monitoring-vpc.id
  route {
    gateway_id = aws_internet_gateway.monitoring-igw.id
    cidr_block = var.anywhere-cidr
  }
  tags = {
    Name = "Monitoring and Alerting Public Route Table"
    IAC = "Terraform"
  }
}

resource "aws_route_table" "monitoring-private-route-table" {
  vpc_id = aws_vpc.monitoring-vpc.id
  route {
    gateway_id = aws_nat_gateway.monitoring-nat.id
    cidr_block = var.anywhere-cidr
  }
  tags = {
    Name = "Monitoring and Alerting Private Route Table"
    IAC = "Terraform"
  }
}


##############################################################################################################################
#                                        VPC Route Tables Association
##############################################################################################################################

resource "aws_route_table_association" "public-rt" {
  route_table_id = aws_route_table.monitoring-public-routetable.id
  subnet_id = aws_subnet.monitoring-public-subnet.id
}

resource "aws_route_table_association" "private-rt" {
  route_table_id = aws_route_table.monitoring-private-route-table.id
  subnet_id = aws_subnet.monitoring-private-subnet.id
}


##############################################################################################################################
#                                           VPC Internet Gateway
##############################################################################################################################

resource "aws_internet_gateway" "monitoring-igw" {
  vpc_id = aws_vpc.monitoring-vpc.id
  tags = {
    Name = "Monitoring and Alerting IGW"
    IAC = "Terraform"
  }
}

##############################################################################################################################
#                                            VPC NAT Gateway
##############################################################################################################################

resource "aws_eip" "elastic-ip-1" {
  tags = {
    Name = "NAT-Gateway-elastic-ip"
    IAC = "Terraform"
  }
}

resource "aws_nat_gateway" "monitoring-nat" {
  allocation_id = aws_eip.elastic-ip-1.id
  subnet_id = aws_subnet.monitoring-public-subnet.id
  tags = {
    Name = "Monitoring and Alerting NAT Gateway"
    IAC = "Terraform"
  }
}