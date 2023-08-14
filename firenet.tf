module "mc-transit" {
  source  = "terraform-aviatrix-modules/mc-transit/aviatrix"
  version = "2.5.1"
  cloud   = "AWS"
  name    = "avx-firenet"
  region  = "us-east-1"
  cidr    = "10.128.0.0/23"
  account = "aws-lab-jye"
  gw_name = "avx-firenet"
  hybrid_connection = true
  enable_firenet = true
  instance_size = "c5n.xlarge"
}


resource "aviatrix_aws_tgw_network_domain" "security" {
  name     = "security"
  tgw_name = aviatrix_aws_tgw.tgw.tgw_name
  aviatrix_firewall = true

}

resource "aviatrix_aws_tgw_vpc_attachment" "firenet" {
  tgw_name            = aviatrix_aws_tgw.tgw.tgw_name
  region              = aviatrix_aws_tgw.tgw.region
  network_domain_name = aviatrix_aws_tgw_network_domain.security.name
  vpc_account_name    = "aws-lab-jye"
  vpc_id              = module.mc-transit.vpc.vpc_id
  disable_local_route_propagation = false
}

resource "aviatrix_firewall_instance" "firewall_instance_1" {
    firewall_name = "palo1"
    firewall_size = "m5.xlarge"
    vpc_id = module.mc-transit.vpc.vpc_id
    firewall_image = "Palo Alto Networks VM-Series Next-Generation Firewall (BYOL)"

    egress_subnet = "10.128.0.16/28"
    firenet_gw_name = module.mc-transit.transit_gateway.gw_name
    iam_role = aws_iam_role.this.name
    bootstrap_bucket_name = aws_s3_bucket.this.bucket
    management_subnet = "10.128.0.0/28"
}

resource "aviatrix_firewall_instance" "firewall_instance_2" {
    firewall_name = "palo2"
    firewall_size = "m5.xlarge"
    vpc_id = module.mc-transit.vpc.vpc_id
    firewall_image = "Palo Alto Networks VM-Series Next-Generation Firewall Bundle 1"
    egress_subnet = "10.128.0.48/28"
    firenet_gw_name = module.mc-transit.transit_gateway.ha_gw_name
    iam_role = aws_iam_role.this.name
    bootstrap_bucket_name = aws_s3_bucket.this.bucket
    management_subnet = "10.128.0.32/28"
}

resource "aviatrix_firewall_instance_association" "firewall_instance_association_1" {
    vpc_id = module.mc-transit.vpc.vpc_id
    firenet_gw_name = module.mc-transit.transit_gateway.gw_name
    instance_id = aviatrix_firewall_instance.firewall_instance_1.instance_id
    # vendor_type = "Palo Alto Networks VM-Series"
    firewall_name = "palo1"
    lan_interface = aviatrix_firewall_instance.firewall_instance_1.lan_interface
    management_interface = aviatrix_firewall_instance.firewall_instance_1.management_interface
    egress_interface = aviatrix_firewall_instance.firewall_instance_1.egress_interface
    attached = true
}

resource "aviatrix_firewall_instance_association" "firewall_instance_association_2" {
    vpc_id = module.mc-transit.vpc.vpc_id
    firenet_gw_name = module.mc-transit.transit_gateway.ha_gw_name
    instance_id = aviatrix_firewall_instance.firewall_instance_2.instance_id
    # vendor_type = "Palo Alto Networks VM-Series"
    firewall_name = "palo2"
    lan_interface = aviatrix_firewall_instance.firewall_instance_2.lan_interface
    management_interface = aviatrix_firewall_instance.firewall_instance_2.management_interface
    egress_interface = aviatrix_firewall_instance.firewall_instance_2.egress_interface
    attached = true
}

data "aviatrix_firenet_vendor_integration" "firewall_instance_1" {
  vpc_id        = module.mc-transit.vpc.vpc_id
  instance_id   = aviatrix_firewall_instance.firewall_instance_1.instance_id
  vendor_type   = "Palo Alto Networks VM-Series"
  public_ip     = aviatrix_firewall_instance.firewall_instance_1.public_ip
  username      = "admin"
  password      = "YW3usHoAhrFEw0WiwFfd"
  firewall_name = "palo1"
  save          = true
}

data "aviatrix_firenet_vendor_integration" "firewall_instance_2" {
  vpc_id        = module.mc-transit.vpc.vpc_id
  instance_id   = aviatrix_firewall_instance.firewall_instance_2.instance_id
  vendor_type   = "Palo Alto Networks VM-Series"
  public_ip     = aviatrix_firewall_instance.firewall_instance_2.public_ip
  username      = "admin"
  password      = "YW3usHoAhrFEw0WiwFfd"
  firewall_name = "palo2"
  save          = true
}