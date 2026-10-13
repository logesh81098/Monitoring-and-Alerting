output "vpc-id" {
  value = aws_vpc.monitoring-vpc.id
}

output "private-subnet-id" {
  value = aws_subnet.monitoring-private-subnet.id
}