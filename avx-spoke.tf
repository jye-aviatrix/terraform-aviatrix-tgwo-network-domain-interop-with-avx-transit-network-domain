### Prd

module "mc_spoke_prd" {
  source             = "terraform-aviatrix-modules/mc-spoke/aviatrix"
  version            = "1.6.3"
  cloud              = "AWS"
  name               = "avx-spoke-prd"
  region             = "us-east-1"
  cidr               = "10.64.1.0/24"
  account            = "aws-lab-jye"
  gw_name            = "avx-spoke-prd"
  insane_mode        = false
  ha_gw              = false
  transit_gw         = aviatrix_transit_gateway.edge_transit.gw_name
}


module "prd-pub" {
  source    = "jye-aviatrix/aws-linux-vm-public/aws"
  version   = "2.0.3"
  key_name  = "ec2-key-pair"
  vm_name   = "avx-prd-pub"
  vpc_id    = module.mc_spoke_prd.vpc.vpc_id
  subnet_id = module.mc_spoke_prd.vpc.public_subnets[0].subnet_id
  use_eip   = true
}

output "prd-pub" {
  value = module.prd-pub
}


# Create an Aviatrix Segmentation Network Domain
resource "aviatrix_segmentation_network_domain" "avx_prd" {
  domain_name = "avx-prd"
}

# Create an Aviatrix Segmentation Network Domain Association
resource "aviatrix_segmentation_network_domain_association" "avx_prd" {
  network_domain_name  = aviatrix_segmentation_network_domain.avx_prd.domain_name
  attachment_name      = module.mc_spoke_prd.spoke_gateway.gw_name
  transit_gateway_name = aviatrix_transit_gateway.edge_transit.gw_name
}


# Dev
module "mc_spoke_dev" {
  source             = "terraform-aviatrix-modules/mc-spoke/aviatrix"
  version            = "1.6.3"
  cloud              = "AWS"
  name               = "avx-spoke-dev"
  region             = "us-east-1"
  cidr               = "10.64.2.0/24"
  account            = "aws-lab-jye"
  gw_name            = "avx-spoke-dev"
  insane_mode        = false
  ha_gw              = false
  transit_gw         = aviatrix_transit_gateway.edge_transit.gw_name
}


module "dev-pub" {
  source    = "jye-aviatrix/aws-linux-vm-public/aws"
  version   = "2.0.3"
  key_name  = "ec2-key-pair"
  vm_name   = "avx-dev-pub"
  vpc_id    = module.mc_spoke_dev.vpc.vpc_id
  subnet_id = module.mc_spoke_dev.vpc.public_subnets[0].subnet_id
  use_eip   = true
}

output "dev-pub" {
  value = module.dev-pub
}


# Create an Aviatrix Segmentation Network Domain
resource "aviatrix_segmentation_network_domain" "avx_dev" {
  domain_name = "avx-dev"
}

# Create an Aviatrix Segmentation Network Domain Association
resource "aviatrix_segmentation_network_domain_association" "avx_dev" {
  network_domain_name  = aviatrix_segmentation_network_domain.avx_dev.domain_name
  attachment_name      = module.mc_spoke_dev.spoke_gateway.gw_name
  transit_gateway_name = aviatrix_transit_gateway.edge_transit.gw_name
}

### svc

module "mc_spoke_svc" {
  source             = "terraform-aviatrix-modules/mc-spoke/aviatrix"
  version            = "1.6.3"
  cloud              = "AWS"
  name               = "avx-spoke-svc"
  region             = "us-east-1"
  cidr               = "10.64.3.0/24"
  account            = "aws-lab-jye"
  gw_name            = "avx-spoke-svc"
  insane_mode        = false
  ha_gw              = false
  transit_gw         = aviatrix_transit_gateway.edge_transit.gw_name
}


module "svc-pub" {
  source    = "jye-aviatrix/aws-linux-vm-public/aws"
  version   = "2.0.3"
  key_name  = "ec2-key-pair"
  vm_name   = "avx-svc-pub"
  vpc_id    = module.mc_spoke_svc.vpc.vpc_id
  subnet_id = module.mc_spoke_svc.vpc.public_subnets[0].subnet_id
  use_eip   = true
}

output "svc-pub" {
  value = module.svc-pub
}


# Create an Aviatrix Segmentation Network Domain
resource "aviatrix_segmentation_network_domain" "avx_svc" {
  domain_name = "avx-svc"
}

# Create an Aviatrix Segmentation Network Domain Association
resource "aviatrix_segmentation_network_domain_association" "avx_svc" {
  network_domain_name  = aviatrix_segmentation_network_domain.avx_svc.domain_name
  attachment_name      = module.mc_spoke_svc.spoke_gateway.gw_name
  transit_gateway_name = aviatrix_transit_gateway.edge_transit.gw_name
}