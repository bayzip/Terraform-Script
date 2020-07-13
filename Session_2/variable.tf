##### Configuration Network #####
variable "av_zone_a" {
  description = "AV Zone"
  type = string
  default = "ap-southeast-5a"
}

variable "av_zone_b" {
  description = "AV Zone"
  type = string
  default = "ap-southeast-5b"
}

#### Instance Configuration #####
variable "image_id" {
  description = "Images that use to create instance"
  type = string
  default = "ubuntu_18_04_x64_20G_alibase_20200521.vhd"
}

variable "ecs_instance_type" {
  description = "Instance Type ECS"
  type = string
  default = "ecs.t5-lc1m1.small"
}

variable "inet_charge_type" {
  description = "Internet charge type"
  type = string
  default = "PayByBandwidth"
}

variable "instance_charge_type" {
  description = "Instance charge type"
  type = string
  default = "PostPaid"
}

variable "keypair_instance" {
  description = "Instance type that use to create instance"
  type = string
  default = "alicloud_testing"
}
