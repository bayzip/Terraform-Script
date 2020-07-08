#### ZONE A #####

output "instance_id" {
  description = "Instance ID"
  value   = module.Instance_ZoneA.this_instance_id
}

output "instance_public_ip" {
  description = "Instance ID"
  value   = module.Instance_ZoneA.this_instance_public_ip
}

output "vswitch_id" {
  description = "Instance ID"
  value   = module.Instance_ZoneA.this_vswitch_id
}

output "security_group_id" {
  description = "Instance ID"
  value   = module.Instance_ZoneA.this_security_group_id
}

#### ZONE B #####

output "instance_id" {
  description = "Instance ID"
  value   = module.Instance_ZoneB.this_instance_id
}

output "instance_public_ip" {
  description = "Instance ID"
  value   = module.Instance_ZoneB.this_instance_public_ip
}

output "vswitch_id" {
  description = "Instance ID"
  value   = module.Instance_ZoneB.this_vswitch_id
}

output "security_group_id" {
  description = "Instance ID"
  value   = module.Instance_ZoneB.this_security_group_id
}