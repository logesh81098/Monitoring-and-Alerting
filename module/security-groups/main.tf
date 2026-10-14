##############################################################################################################################
#                                           Security Group
##############################################################################################################################

resource "aws_security_group" "monitoring-and-alerting-sg" {
  name = "Monitoring and Alerting SG"
  description = "Security Group for Monitoring and Alerting Server"
  vpc_id = var.vpc-id

  ingress {
    from_port = var.ssh-port
    to_port = var.ssh-port
    cidr_blocks = [ var.my-public-ip ]
    protocol = "tcp"
    description = "Ingress Rule for SSH Port"
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ var.anywhere-ip ]
    description = "Outbound Rule"
  }
  tags = {
    Name = "Monitoring and Alerting SG"
    IAC = "Terraform"
  }
}  