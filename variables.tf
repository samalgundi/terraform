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

#####################################################
# Cloudant Instance
# Copyright 2021 IBM
#####################################################

variable "provision" {
  description = "Enable this to provision the cloudant instance (true/false)"
  type        = bool
  default     = true
}

variable "provision_resource_key" {
  description = "Enable this to bind key to cloudant instance (true/false)"
  type        = bool
  default     = true
}

variable "instance_name" {
  description = "Name of the cloudant instance"
  type        = string
}

variable "plan" {
  description = "plan type (standard and lite)"
  type        = string
  default     = "standard"
}

variable "create_timeout" {
  type        = string
  description = "Timeout duration for create."
  default     = null
}

variable "update_timeout" {
  type        = string
  description = "Timeout duration for update."
  default     = null
}

variable "delete_timeout" {
  type        = string
  description = "Timeout duration for delete."
  default     = null
}

variable "resource_group_id" {
  description = "Enter resource group name"
  type        = string
}

variable "service_endpoints" {
  description = "Types of the service endpoints. Possible values are 'public', 'private', 'public-and-private'."
  type        = string
  default     = null
}

variable "resource_key_name" {
  description = "Name of the resource key"
  type        = string
}

variable "tags" {
  type        = list(string)
  description = "Tags that should be applied to the service"
  default     = null
}

variable "parameters" {
  type        = map(string)
  description = "Arbitrary parameters to pass"
  default     = null
}

variable "role" {
  description = "Resource key role"
  type        = string
}

variable "resource_key_tags" {
  type        = list(string)
  description = "Tags that should be applied to the service"
  default     = null
}

/*
#####################################################
# Service Policy Configuration
#####################################################
variable "service_policy_provision" {
  description = "Enable this to provision the service policy (true/false)"
  type        = bool
}
variable "service_name" {
  description = "Name of the service ID"
  type        = string
}
variable "description" {
  description = "Description to service ID"
  type        = string
  default     = null
}
variable "roles" {
  description = "service policy roles"
  type        = list(string)
}
*/
