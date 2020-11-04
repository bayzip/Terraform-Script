module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "vpc-${var.service.environment}-${var.service.name}"
  cidr = var.network.cidr

  azs             = var.network.azs
  private_subnets = var.network.private
  public_subnets  = var.network.public

  enable_nat_gateway = true
  single_nat_gateway = true
  one_nat_gateway_per_az = false
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "rnd"
  }
}