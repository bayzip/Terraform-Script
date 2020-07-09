##### Configuration Network #####
variable "vpc_name" {
  description = "VPC name"
  type = string
  default = "tf_ali_vpc"
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type = string
  default = "192.168.0.0/16"
}

variable "sg_name" {
  description = "SG Name"
  type = string
  default = "tf_ali_sg"
}

variable "vswitch_name" {
  description = "vswitch Name"
  type = string
  default = "tf_ali_vswitch"
}

variable "vswitch_cidr" {
  description = "VSwitch CIDR"
  type = string
  default = "192.168.0.0/24"
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