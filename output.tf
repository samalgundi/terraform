
output "log_analysis_instance_id" {
  description = "ID of IBM Log Analysis instance"
  value       = module.logdna_instance.logdna_instance_id
}

output "sysdig_instance_id" {
  description = "ID of IBM Cloud Monitoring instance"
  value       = module.sysdig_instance.sysdig_id
}

output "activity_tracker_instance_id" {
  description = "ID of IBM Cloud Activity Tracker instance"
  value       = module.activity_tracker_instance.tracker_id
}

output "logdna_instance_key_id" {
  description = "The ID of the Logdna instance key"
  value       = module.logdna_instance.logdna_instance_key_id
}

output "sysdig_key_id" {
  description = "The ID of the Sysdig instance key"
  value       = module.sysdig_instance.sysdig_key_id
}

output "log_analysis_instance_name" {
  description = "Name of IBM Log Analysis instance"
  value       = local.log_analysis_name
}

output "sysdig_instance_name" {
  description = "Name of IBM Cloud Monitoring instance"
  value       = local.sysdig_name
}

output "activity_tracker_instance_name" {
  description = "Name of IBM Cloud Activity Tracker instance"
  value       = local.activity_tracker_name
}
