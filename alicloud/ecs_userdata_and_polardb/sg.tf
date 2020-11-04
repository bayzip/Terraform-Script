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

resource "alicloud_security_group_rule" "allow_ssh" {
  security_group_id = alicloud_security_group.sg.id
  ip_protocol = "tcp"
  type = "ingress"
  cidr_ip = "0.0.0.0/0"
  port_range = "22/22"
  priority = 1
}

resource "alicloud_security_group_rule" "allow_http" {
  security_group_id = alicloud_security_group.sg.id
  ip_protocol = "tcp"
  type = "ingress"
  cidr_ip = "0.0.0.0/0"
  port_range = "80/80"
  priority = 1
}