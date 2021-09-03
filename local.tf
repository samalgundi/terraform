locals {
  log_analysis_name                  = "${var.observability_instance_name}-LogDNA-${var.region}"
  activity_tracker_name              = "${var.observability_instance_name}-ActivityTracker-${var.region}"
  sysdig_name                        = "${var.observability_instance_name}-SysDig-${var.region}"
  default_tags                       = ["template_source: schematics-solution", "template: terraform-ibm-observability", "template_version: 1.0"]
  tags                               = concat(local.default_tags, tolist(setsubtract(split(",", var.observability_tags), [""])))
  is_bind_observability_resource_key = true
}
