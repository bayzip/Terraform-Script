resource "alicloud_vpc" "ali_vpc" {
  name = var.vpc_name
  cidr_block = var.vpc_cidr
}

resource "alicloud_security_group" "sg" {
  name = var.sg_name
  description = "Alicloud Security Group"
  vpc_id = alicloud_vpc.ali_vpc.id
}

resource "alicloud_vswitch" "vswitch" {
  name = var.vswitch_name
  availability_zone = var.av_zone
  cidr_block = var.vswitch_cidr
  vpc_id = alicloud_vpc.ali_vpc.id
}

resource "alicloud_instance" "myinstance" {
  image_id = var.image_id
  instance_type = var.ecs_instance_type
  security_groups = alicloud_security_group.sg.*.id
  vswitch_id = alicloud_vswitch.vswitch.id
  availability_zone = var.av_zone
  internet_charge_type = var.inet_charge_type
  instance_charge_type = var.instance_charge_type
  key_name = var.keypair_instance
}
