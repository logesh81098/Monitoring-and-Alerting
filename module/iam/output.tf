output "monitoring-and-alerting-instance-profile" {
  value = aws_iam_instance_profile.monitoring-server-role.name
}