module "vpc" {
  source = "./module/vpc"
}

module "ec2-instance" {
  source    = "./module/ec2-instance"
  subnet-id = module.vpc.public-subnet-id
  monitoring-and-alerting-sg = module.security-groups.monitoring-and-alerting-sg-id
  monitoring-and-alerting-keyname = module.key-pair.monitoring-and-alerting-keyname
  monitoring-and-alerting-instance-profile = module.iam.monitoring-and-alerting-instance-profile
}

module "security-groups" {
  source = "./module/security-groups"
  vpc-id = module.vpc.vpc-id
}

module "iam" {
  source = "./module/iam"
}

module "key-pair" {
  source = "./module/key-pair"
}