resource "aviatrix_aws_tgw_network_domain" "edge" {
  name     = "Aviatrix_Edge_Domain"
  tgw_name = aviatrix_aws_tgw.tgw.tgw_name
}


resource "aviatrix_aws_tgw_network_domain" "shared" {
  name     = "Shared_Service_Domain"
  tgw_name = aviatrix_aws_tgw.tgw.tgw_name
}



resource "aviatrix_aws_tgw_network_domain" "default" {
  name     = "Default_Domain"
  tgw_name = aviatrix_aws_tgw.tgw.tgw_name
}


resource "aviatrix_aws_tgw_network_domain" "ue1-prd" {
  name     = "ue1-prd"
  tgw_name = aviatrix_aws_tgw.tgw.tgw_name
  depends_on = [ aviatrix_aws_tgw_network_domain.default,aviatrix_aws_tgw_network_domain.edge,aviatrix_aws_tgw_network_domain.shared ]
}

resource "aviatrix_aws_tgw_network_domain" "ue1-dev" {
  name     = "ue1-dev"
  tgw_name = aviatrix_aws_tgw.tgw.tgw_name
  depends_on = [ aviatrix_aws_tgw_network_domain.default,aviatrix_aws_tgw_network_domain.edge,aviatrix_aws_tgw_network_domain.shared ]
}

resource "aviatrix_aws_tgw_network_domain" "ue1-svc" {
  name     = "ue1-svc"
  tgw_name = aviatrix_aws_tgw.tgw.tgw_name
  depends_on = [ aviatrix_aws_tgw_network_domain.default,aviatrix_aws_tgw_network_domain.edge,aviatrix_aws_tgw_network_domain.shared ]
}