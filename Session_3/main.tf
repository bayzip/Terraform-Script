resource "alicloud_instance" "ec2_data" {
  image_id = "ubuntu_18_04_x64_20G_alibase_20200521.vhd"
  instance_type = "ecs.t5-lc1m1.small"
  security_groups = ["${alicloud_security_group.sg.id}"]
  vswitch_id = alicloud_vswitch.zone_A.id
  availability_zone = var.av_zone_a
  internet_max_bandwidth_out = 1
  internet_charge_type = "PayByBandwidth"
  instance_charge_type = "PostPaid"
  key_name = "alicloud_testing"
  user_data = "${file("user_data.sh")}"
}
