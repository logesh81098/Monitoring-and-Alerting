module "vpc" {
  source = "./module/vpc"
}

module "ec2-instance" {
  source    = "./module/ec2-instance"
  subnet-id = module.vpc.private-subnet-id
}

module "security-groups" {
  source = "./module/security-groups"
  vpc-id = module.vpc.vpc-id
}

module "iam" {
  source = "./module/iam"
}