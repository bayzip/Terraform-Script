module "Instance_ZoneA" {
  source = "../modules/create_instance"

  av_zone               = "ap-southeast-5a"
  vpc_name              = var.vpc_name
  vpc_cidr              = var.vpc_cidr
  sg_name               = var.sg_name
  vswitch_name          = var.vswitch_name
  vswitch_cidr          = var.vswitch_cidr
  image_id              = var.image_id
  ecs_instance_type     = var.ecs_instance_type
  inet_charge_type      = var.inet_charge_type
  instance_charge_type  = var.instance_charge_type
  keypair_instance      = var.keypair_instance
}

module "Instance_ZoneB" {
  source = "../modules/create_instance"

  av_zone               = "ap-southeast-5b"
  vpc_name              = var.vpc_name
  vpc_cidr              = var.vpc_cidr
  sg_name               = var.sg_name
  vswitch_name          = var.vswitch_name
  vswitch_cidr          = var.vswitch_cidr
  image_id              = var.image_id
  ecs_instance_type     = var.ecs_instance_type
  inet_charge_type      = var.inet_charge_type
  instance_charge_type  = var.instance_charge_type
  keypair_instance      = var.keypair_instance
}

resource "alicloud_slb" "ali_slb" {
  name        = "slb_test"
  vswitch_id  = var.vswitch_cidr
}

resource "alicloud_slb_listener" "http" {
  load_balancer_id = alicloud_slb.ali_slb.id
  frontend_port = 80
  backend_port = 80
  health_check_connect_port = 80
  protocol = "http"
}

resource "alicloud_slb_attachment" "attached_ali_slb" {
  instance_ids = ["module.Instance_ZoneA.this_instance_id","module.Instance_ZoneB.this_instance_id"]
  load_balancer_id = alicloud_slb.ali_slb.id
}
