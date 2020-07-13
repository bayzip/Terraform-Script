output "this_instance_id" {
  description = "The instance ID"
  value = "${alicloud_instance.myinstance.id}"
}

output "this_instance_public_ip" {
  description = "The instance Public ID"
  value = "${alicloud_instance.myinstance.public_ip}"
}
