# Create an Aviatrix Segmentation Network Domain
resource "aviatrix_segmentation_network_domain_connection_policy" "svc_to_dev" {
  domain_name_1 = aviatrix_segmentation_network_domain.avx_svc.domain_name
  domain_name_2 = aviatrix_segmentation_network_domain.avx_dev.domain_name
}

resource "aviatrix_segmentation_network_domain_connection_policy" "svc_to_prd" {
  domain_name_1 = aviatrix_segmentation_network_domain.avx_svc.domain_name
  domain_name_2 = aviatrix_segmentation_network_domain.avx_prd.domain_name
}