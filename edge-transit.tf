resource "aviatrix_vpc" "edge_transit_vpc" {
  cloud_type           = 1
  account_name         = "aws-lab-jye"
  name                 = "edge-transit-vpc"
  aviatrix_transit_vpc = true
  aviatrix_firenet_vpc = false
  region               = "us-east-1"
  cidr                 = "10.16.0.0/23"
}

resource "aviatrix_transit_gateway" "edge_transit" {
  single_az_ha                  = true
  gw_name                       = "edge-transit"
  vpc_id                        = aviatrix_vpc.edge_transit_vpc.vpc_id
  cloud_type                    = 1
  vpc_reg                       = "us-east-1"
  gw_size                       = "c5.xlarge"
  insane_mode                   = true
  insane_mode_az                = "us-east-1a"
  account_name                  = "aws-lab-jye"
  enable_hybrid_connection      = true
  subnet                        = "10.16.0.128/26"
  enable_encrypt_volume         = true
  enable_learned_cidrs_approval = true
  local_as_number   = "65101"
  ha_insane_mode_az = "us-east-1b"
  ha_subnet         = "10.16.0.192/26"
  ha_gw_size        = "c5.xlarge"
  connected_transit = true
  enable_segmentation = true
}


# Create an Aviatrix AWS TGW Transit Gateway Attachment
resource "aviatrix_aws_tgw_transit_gateway_attachment" "edge_to_tgwo" {
  tgw_name             = aviatrix_aws_tgw.tgw.tgw_name
  region               = aviatrix_aws_tgw.tgw.region
  vpc_account_name     = "aws-lab-jye"
  vpc_id               = aviatrix_vpc.edge_transit_vpc.vpc_id
  transit_gateway_name = aviatrix_transit_gateway.edge_transit.gw_name
}