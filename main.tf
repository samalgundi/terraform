provider "ibm" {
  region = var.region
}
data "ibm_resource_group" "rg" {
  name = var.observability_resource_group_name
}
module "logdna_instance" {
  source            = "terraform-ibm-modules/observability/ibm//modules/logging-logdna"
  bind_resource_key = local.is_bind_observability_resource_key
  service_name      = local.log_analysis_name
  resource_group_id = data.ibm_resource_group.rg.id
  plan              = var.logdna_service_plan
  region            = var.region
  resource_key_name = var.observability_resource_key_name
  role              = var.observability_resource_key_role
  tags              = local.tags
}

module "sysdig_instance" {
  source            = "terraform-ibm-modules/observability/ibm//modules/monitoring-sysdig"
  bind_resource_key = local.is_bind_observability_resource_key
  service_name      = local.sysdig_name
  resource_group_id = data.ibm_resource_group.rg.id
  plan              = var.sysdig_service_plan
  region            = var.region
  service_endpoints = var.observability_visibility
  resource_key_name = var.observability_resource_key_name
  role              = var.observability_resource_key_role
  tags              = local.tags
}


module "activity_tracker_instance" {
  source            = "terraform-ibm-modules/observability/ibm//modules/activity-tracker-logdna"
  service_name      = local.activity_tracker_name
  plan              = var.activity_tracker_service_plan
  region            = var.region
  resource_group_id = data.ibm_resource_group.rg.id
  tags              = local.tags
}
  
resource "ibm_database" "test_acc" {
  resource_group_id = data.ibm_resource_group.group.id
  name              = "demo-postgres"
  service           = "databases-for-postgresql"
  plan              = "standard"
  location          = "eu-gb"
  adminpassword     = "adminpassword"

  tags = ["tag1", "tag2"]

  // adminpassword                = "password12"
  members_memory_allocation_mb = 3072
  members_disk_allocation_mb   = 20480

  users {
    name     = "user123"
    password = "password12"
  }
}
