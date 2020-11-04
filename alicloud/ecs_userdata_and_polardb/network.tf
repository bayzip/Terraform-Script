resource "alicloud_vpc" "ali_vpc" {
  name = "demo_vpc"
  cidr_block = "10.0.0.0/21"
}

resource "alicloud_vswitch" "zone_A" {
  name = "demo_zone_a"
  availability_zone = var.av_zone_a
  cidr_block = "10.0.1.0/24"
  vpc_id = alicloud_vpc.ali_vpc.id
}