resource "aviatrix_aws_tgw_vpc_attachment" "ue1-prd" {
  tgw_name            = aviatrix_aws_tgw.tgw.tgw_name
  region              = aviatrix_aws_tgw.tgw.region
  network_domain_name = aviatrix_aws_tgw_network_domain.ue1-prd.name
  vpc_account_name    = "aws-lab-jye"
  vpc_id              = aviatrix_vpc.ue1-prd.vpc_id
  disable_local_route_propagation = false
}

resource "aviatrix_aws_tgw_vpc_attachment" "ue1-dev" {
  tgw_name            = aviatrix_aws_tgw.tgw.tgw_name
  region              = aviatrix_aws_tgw.tgw.region
  network_domain_name = aviatrix_aws_tgw_network_domain.ue1-dev.name
  vpc_account_name    = "aws-lab-jye"
  vpc_id              = aviatrix_vpc.ue1-dev.vpc_id
  disable_local_route_propagation = false
}

resource "aviatrix_aws_tgw_vpc_attachment" "ue1-svc" {
  tgw_name            = aviatrix_aws_tgw.tgw.tgw_name
  region              = aviatrix_aws_tgw.tgw.region
  network_domain_name = aviatrix_aws_tgw_network_domain.ue1-svc.name
  vpc_account_name    = "aws-lab-jye"
  vpc_id              = aviatrix_vpc.ue1-svc.vpc_id
  disable_local_route_propagation = false
}