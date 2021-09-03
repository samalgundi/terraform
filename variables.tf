variable "observability_resource_group_name" {
  description = "Name of the resource group."
  type        = string
}
variable "sysdig_service_plan" {
  description = "Name of the service plan for sysdig instance, refer to http://servicedata.mybluemix.net for accurate service plan name."
  type        = string

}

variable "logdna_service_plan" {
  description = "Name of the service plan for logdna instance, refer to http://servicedata.mybluemix.net for accurate service plan name."
  type        = string
}

variable "activity_tracker_service_plan" {
  description = "Name of the service plan for activity tracker instance, refer to http://servicedata.mybluemix.net for accurate service plan name."
  type        = string
}
variable "observability_instance_name" {
  description = "Name of the Observability service instance."
  type        = string

}
variable "region" {
  description = "Name of the region (for example, us-south, eu-de)"
}

variable "observability_resource_key_role" {
  description = "Service role assigned to the resource key, while binding to the observability service instances.  Refer to https://cloud.ibm.com/docs/account?topic=account-userroles for the role names."
  type        = string
  default     = "Manager"
}
variable "observability_visibility" {
  description = "Visibility of the observability services (eg. public, private)"
  type        = string
  default     = "public"
}

variable "observability_resource_key_name" {
  description = "Name of the observability resource key"
  type        = string
  default     = "test_key"
}

variable "TF_VERSION" {
  default     = "0.13"
  description = "terraform engine version to be used in schematics"

}
variable "observability_tags" {
  type        = string
  description = "Tags that should be applied to the observability services"
  default     = ""
}
