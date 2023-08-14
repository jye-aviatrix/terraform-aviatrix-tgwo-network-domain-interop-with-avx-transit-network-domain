resource "aviatrix_aws_tgw_peering_domain_conn" "svc_to_prd" {
  tgw_name1    = aviatrix_aws_tgw.tgw.tgw_name
  domain_name1 = aviatrix_aws_tgw_network_domain.ue1-svc.name
  tgw_name2    = aviatrix_aws_tgw.tgw.tgw_name
  domain_name2 = aviatrix_aws_tgw_network_domain.ue1-prd.name
}


resource "aviatrix_aws_tgw_peering_domain_conn" "svc_to_dev" {
  tgw_name1    = aviatrix_aws_tgw.tgw.tgw_name
  domain_name1 = aviatrix_aws_tgw_network_domain.ue1-svc.name
  tgw_name2    = aviatrix_aws_tgw.tgw.tgw_name
  domain_name2 = aviatrix_aws_tgw_network_domain.ue1-dev.name
}


resource "aviatrix_aws_tgw_peering_domain_conn" "edge_to_dev" {
  tgw_name1    = aviatrix_aws_tgw.tgw.tgw_name
  domain_name1 = aviatrix_aws_tgw_network_domain.edge.name
  tgw_name2    = aviatrix_aws_tgw.tgw.tgw_name
  domain_name2 = aviatrix_aws_tgw_network_domain.ue1-dev.name
}

resource "aviatrix_aws_tgw_peering_domain_conn" "edge_to_prd" {
  tgw_name1    = aviatrix_aws_tgw.tgw.tgw_name
  domain_name1 = aviatrix_aws_tgw_network_domain.edge.name
  tgw_name2    = aviatrix_aws_tgw.tgw.tgw_name
  domain_name2 = aviatrix_aws_tgw_network_domain.ue1-prd.name
}

resource "aviatrix_aws_tgw_peering_domain_conn" "edge_to_svc" {
  tgw_name1    = aviatrix_aws_tgw.tgw.tgw_name
  domain_name1 = aviatrix_aws_tgw_network_domain.edge.name
  tgw_name2    = aviatrix_aws_tgw.tgw.tgw_name
  domain_name2 = aviatrix_aws_tgw_network_domain.ue1-svc.name
}