resource "aws_security_group" "sg_dev" {
  name          = "${var.service.environment}_${var.service.name}"
  vpc_id        = var.asg_config.vpc_id

  ingress {
    description     = "Allow ssh traffic"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.service.environment}_${var.service.name}"
  }
}
