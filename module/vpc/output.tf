output "vpc-id" {
  value = aws_vpc.monitoring-vpc.id
}

output "public-subnet-id" {
  value = aws_subnet.monitoring-public-subnet.id
}