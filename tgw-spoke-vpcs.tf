resource "aviatrix_vpc" "ue1-prd" {
  cloud_type           = 1
  account_name         = "aws-lab-jye"
  name                 = "ue1-prd"
  aviatrix_transit_vpc = false
  aviatrix_firenet_vpc = false
  region               = "us-east-1"
  cidr                 = "10.32.1.0/24"
}

module "ue1-prd-pub" {
  source    = "jye-aviatrix/aws-linux-vm-public/aws"
  version   = "2.0.2"
  key_name  = "ec2-key-pair"
  vm_name   = "ue1-prd-pub"
  vpc_id    = aviatrix_vpc.ue1-prd.vpc_id
  subnet_id = aviatrix_vpc.ue1-prd.public_subnets[0].subnet_id
  use_eip   = true
}

output "ue1-prd-pub" {
  value = module.ue1-prd-pub
}




resource "aviatrix_vpc" "ue1-dev" {
  cloud_type           = 1
  account_name         = "aws-lab-jye"
  name                 = "ue1-dev"
  aviatrix_transit_vpc = false
  aviatrix_firenet_vpc = false
  region               = "us-east-1"
  cidr                 = "10.32.2.0/24"
}

module "ue1-dev-pub" {
  source    = "jye-aviatrix/aws-linux-vm-public/aws"
  version   = "2.0.2"
  key_name  = "ec2-key-pair"
  vm_name   = "ue1-dev-pub"
  vpc_id    = aviatrix_vpc.ue1-dev.vpc_id
  subnet_id = aviatrix_vpc.ue1-dev.public_subnets[0].subnet_id
  use_eip   = true
}

output "ue1-dev-pub" {
  value = module.ue1-dev-pub
}



resource "aviatrix_vpc" "ue1-svc" {
  cloud_type           = 1
  account_name         = "aws-lab-jye"
  name                 = "ue1-svc"
  aviatrix_transit_vpc = false
  aviatrix_firenet_vpc = false
  region               = "us-east-1"
  cidr                 = "10.32.3.0/24"
}

module "ue1-svc-pub" {
  source    = "jye-aviatrix/aws-linux-vm-public/aws"
  version   = "2.0.2"
  key_name  = "ec2-key-pair"
  vm_name   = "ue1-svc-pub"
  vpc_id    = aviatrix_vpc.ue1-svc.vpc_id
  subnet_id = aviatrix_vpc.ue1-svc.public_subnets[0].subnet_id
  use_eip   = true
}

output "ue1-svc-pub" {
  value = module.ue1-svc-pub
}


