resource "alicloud_instance" "myinstance" {
  image_id = var.image_id
  instance_type = var.ecs_instance_type
  security_groups = var.ecs_sg_id
  vswitch_id = var.vswitch_id
  availability_zone = var.av_zone
  internet_charge_type = var.inet_charge_type
  instance_charge_type = var.instance_charge_type
  key_name = var.keypair_instance
}
