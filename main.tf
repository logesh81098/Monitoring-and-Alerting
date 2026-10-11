module "vpc" {
  source = "./module/vpc"
}

module "ec2-instance" {
  source = "./module/ec2-instance"
  subnet-id = module.vpc.private-subnet-id
}