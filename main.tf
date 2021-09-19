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
  
module "cloudant-instance" {

  //Uncomment the following line to point the source to registry level
  //source = "terraform-ibm-modules/cloudant/ibm//modules/instance"

  source                  = "https://github.com/terraform-ibm-modules/terraform-ibm-cloudant.git/modules/instance"
  provision               = var.provision
  provision_resource_key  = var.provision_resource_key

  instance_name           = var.instance_name
  resource_group_id       = data.ibm_resource_group.rg.id
  plan                    = var.plan
  region                  = var.region
  service_endpoints       = var.service_endpoints
  parameters              = local.parameters
  tags                    = var.tags
  create_timeout          = var.create_timeout
  update_timeout          = var.update_timeout
  delete_timeout          = var.delete_timeout
  resource_key_name       = var.resource_key_name
  role                    = var.role
  resource_key_tags       = var.resource_key_tags

  ###################
  # Service Policy
  ###################
  service_policy_provision = var.service_policy_provision
  service_name             = var.service_name
  description              = var.description
  roles                    = var.roles
}
  
resource "ibm_database" "test_acc" {
  resource_group_id = data.ibm_resource_group.rg.id
  name              = "demo-postgres"
  service           = "databases-for-postgresql"
  plan              = "standard"
  location          = var.region
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
