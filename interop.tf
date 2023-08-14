# Create an Aviatrix Segmentation Network Domain Association
resource "aviatrix_segmentation_network_domain_association" "interop_dev" {
  network_domain_name  = aviatrix_segmentation_network_domain.avx_dev.domain_name
  attachment_name      = "${aviatrix_aws_tgw_vpc_attachment.ue1-dev.tgw_name}:${aviatrix_aws_tgw_vpc_attachment.ue1-dev.network_domain_name}"
  transit_gateway_name = aviatrix_transit_gateway.edge_transit.gw_name
}


resource "aviatrix_segmentation_network_domain_association" "interop_prd" {
  network_domain_name  = aviatrix_segmentation_network_domain.avx_prd.domain_name
  attachment_name      = "${aviatrix_aws_tgw_vpc_attachment.ue1-prd.tgw_name}:${aviatrix_aws_tgw_vpc_attachment.ue1-prd.network_domain_name}"
  transit_gateway_name = aviatrix_transit_gateway.edge_transit.gw_name
}

resource "aviatrix_segmentation_network_domain_association" "interop_svc" {
  network_domain_name  = aviatrix_segmentation_network_domain.avx_svc.domain_name
  attachment_name      = "${aviatrix_aws_tgw_vpc_attachment.ue1-svc.tgw_name}:${aviatrix_aws_tgw_vpc_attachment.ue1-svc.network_domain_name}"
  transit_gateway_name = aviatrix_transit_gateway.edge_transit.gw_name
}