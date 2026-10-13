##############################################################################################################################
#                                            Keypair
##############################################################################################################################

resource "tls_private_key" "monitoring-and-alerting" {
  algorithm = "RSA"
  rsa_bits = 4096
}


resource "aws_key_pair" "monitoring-and-alerting-keypair" {
  key_name = "Monitoring-and-Alerting-Keypair"
  public_key = tls_private_key.monitoring-and-alerting.public_key_openssh
}

resource "local_file" "monitoring-and-alerting-privatekey" {
  filename = "monitoring-and-alerting-privatekey"
  content = tls_private_key.monitoring-and-alerting.private_key_openssh
}