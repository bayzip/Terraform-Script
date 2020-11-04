output "instance_ip" {
  value = "${alicloud_instance.ec2_data.public_ip}"
}