##############################################################################################################################
#                                      Monitoring and Alerting Server
##############################################################################################################################

resource "aws_instance" "monitoring-alerting-server" {
  ami = var.ami-id
  instance_type = var.instance-type
  subnet_id = var.subnet-id
}