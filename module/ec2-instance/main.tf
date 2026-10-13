##############################################################################################################################
#                                      Monitoring and Alerting Server
##############################################################################################################################

resource "aws_instance" "monitoring-alerting-server" {
  ami = var.ami-id
  instance_type = var.instance-type
  subnet_id = var.subnet-id
  vpc_security_group_ids = [ var.monitoring-and-alerting-sg ]
  key_name = var.monitoring-and-alerting-keyname
  iam_instance_profile = var.monitoring-and-alerting-instance-profile
  tags = {
    Name = "Monitoring and Alerting Server"
    IAC = "Terraform"
  }
}