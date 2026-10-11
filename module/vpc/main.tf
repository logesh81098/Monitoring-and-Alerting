##############################################################################################################################
#                                              VPC
##############################################################################################################################

resource "aws_vpc" "monitoring-vpc" {
    cidr_block = var.vpc-cidr
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = {
        Name = "Monitoring and Alerting VPC"
        IAC = "Terraform"
    }
}