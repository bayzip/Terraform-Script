module "rolling_update" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "~> 3.4"

  name = "${var.service.environment}-${var.service.name}"

  lc_name                       = "lc-${var.service.environment}-${var.service.name}" # unique name for lauch configuration
  image_id                      = data.aws_ami.ecs.id # Get latest images AMI
  instance_type                 = var.lc_config.instance_type
  security_groups               = [aws_security_group.sg_dev.id]
  key_name                      = var.lc_config.key
  associate_public_ip_address   = false
  recreate_asg_when_lc_changes  = true

  root_block_device = [
    {
      volume_size = "8"
      volume_type = "gp2"
    },
  ]

  # Auto scaling group
  asg_name                  = "asg-${var.service.environment}-${var.service.name}"
  vpc_zone_identifier       = data.aws_subnet_ids.aws_subnet.ids
  health_check_type         = "EC2"
  min_size                  = var.asg_config.min
  max_size                  = var.asg_config.max
  desired_capacity          = var.asg_config.desired
  wait_for_capacity_timeout = 0
  service_linked_role_arn   = aws_iam_service_linked_role.autoscaling.arn

  tags = [
    {
      key                 = "Environment"
      value               = "${var.service.environment}"
      propagate_at_launch = true
    },
    {
      key                 = "Service"
      value               = "${var.service.name}"
      propagate_at_launch = true
    },
  ]
}
