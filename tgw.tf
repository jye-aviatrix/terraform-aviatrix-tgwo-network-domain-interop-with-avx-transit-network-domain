resource "aviatrix_aws_tgw" "tgw" {
  tgw_name           = "tgwo"
  account_name       = "aws-lab-jye"
  region             = "us-east-1"
  aws_side_as_number = 65001
  # manage_security_domain = false
  # manage_vpc_attachment = false
  # manage_transit_gateway_attachment = false
}