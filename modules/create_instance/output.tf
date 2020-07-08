output "this_instance_id" {
  description = "The instance ID"
  value = "alicloud_instance.myinstance.id"
}

output "this_instance_public_ip" {
  description = "The instance Public ID"
  value = "alicloud_instance.myinstance.public_ip"
}

output "this_vswitch_id" {
  description = "The VSwitch ID"
  value = "alicloud_vswitch.vswitch.id"
}

output "this_security_group_id" {
  description = "The Security Group ID"
  value = "alicloud_security_group.sg.id"
}
