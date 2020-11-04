data "aws_subnet_ids" "aws_subnet" {
  vpc_id = var.asg_config.vpc_id
  filter {
    name   = "tag:Name"
    values = ["vpc-${var.service.environment}-${var.service.name}-private-*"]
  }
}

# Get AMI ID for ECS
data "aws_ami" "ecs" {
  # Get the latest version
  most_recent = true

  # Filter only ECS optimized image
  filter {
    name = "name"
    values = [
      "ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name = "virtualization-type"
    values = [
      "hvm"]
  }

  # Search only official images
  owners = [
    "099720109477"
  ]
}