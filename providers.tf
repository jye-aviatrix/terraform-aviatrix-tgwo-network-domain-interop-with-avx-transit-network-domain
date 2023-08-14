terraform {
  required_providers {
    aviatrix = {
      source  = "AviatrixSystems/aviatrix"
      version = "3.1.1"
    }
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure Aviatrix provider
provider "aviatrix" {
}


# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}