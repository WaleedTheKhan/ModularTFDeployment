# Waleed Khan
# April 11, 2025
# This root main.tf file will be where all three modules are called
# upon in order to build a specified topology with only Terraform modular programming.

# Specifying provider and region
provider "aws" {
  region = "us-east-1"
}

# Calling the VPC module
module "vpc" {
  source = "./vpc-module"
}

# Calling the Security Group module
module "sg" {
  source  = "./security-group-module"
  vpc_id  = module.vpc.vpc_id
}

# Calling the EC2 module
module "ec2" {
  source            = "./ec2-module"
  subnet_ids        = module.vpc.subnet_ids
  security_group_id = module.sg.security_group_id
}
