resource "alicloud_vpc" "ali_vpc" {
  name = "demo_vpc"
  cidr_block = "10.0.0.0/21"
}

resource "alicloud_security_group" "sg" {
  name = "demo_sg"
  description = "Alicloud Security Group"
  vpc_id = alicloud_vpc.ali_vpc.id
}

resource "alicloud_security_group_rule" "out_allow_all_traffic" {
  security_group_id = alicloud_security_group.sg.id
  ip_protocol = "all"
  type = "egress"
  cidr_ip = "0.0.0.0/0"
  priority = 1
}

resource "alicloud_security_group_rule" "allow_all_tcp" {
  security_group_id = alicloud_security_group.sg.id
  ip_protocol = "tcp"
  type = "ingress"
  cidr_ip = "0.0.0.0/0"
  port_range = "22/22"
  priority = 1
}

resource "alicloud_vswitch" "zone_A" {
  name = "demo_zone_a"
  availability_zone = var.av_zone_a
  cidr_block = "10.0.1.0/24"
  vpc_id = alicloud_vpc.ali_vpc.id
}

module "Instance_ZoneA" {
  source = "../modules/create_instance"

  av_zone               = var.av_zone_a
  image_id              = var.image_id
  ecs_instance_type     = var.ecs_instance_type
  inet_charge_type      = var.inet_charge_type
  instance_charge_type  = var.instance_charge_type
  keypair_instance      = var.keypair_instance
  ecs_sg_id             = alicloud_security_group.sg.*.id
  vswitch_id            = alicloud_vswitch.zone_A.id
}

resource "alicloud_vswitch" "zone_B" {
  name = "demo_zone_b"
  availability_zone = var.av_zone_b
  cidr_block = "10.0.2.0/24"
  vpc_id = alicloud_vpc.ali_vpc.id
}

module "Instance_ZoneB" {
  source = "../modules/create_instance"

  av_zone               = var.av_zone_b
  image_id              = var.image_id
  ecs_instance_type     = var.ecs_instance_type
  inet_charge_type      = var.inet_charge_type
  instance_charge_type  = var.instance_charge_type
  keypair_instance      = var.keypair_instance
  ecs_sg_id             = alicloud_security_group.sg.*.id
  vswitch_id            = alicloud_vswitch.zone_B.id
}

resource "alicloud_slb" "ali_slb" {
  name        = "slb_test"
  address_type = "internet"
}

resource "alicloud_slb_listener" "http" {
  load_balancer_id = alicloud_slb.ali_slb.id
  frontend_port = 80
  backend_port = 80
  health_check_connect_port = 80
  protocol = "http"
}

resource "alicloud_slb_attachment" "attached_ali_slb" {
  instance_ids = ["${module.Instance_ZoneA.this_instance_id}","${module.Instance_ZoneB.this_instance_id}"]
  load_balancer_id = alicloud_slb.ali_slb.id
}
