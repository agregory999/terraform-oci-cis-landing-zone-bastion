# Copyright (c) 2022 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

variable "tenancy_ocid" {}
variable "user_ocid" {
  default = ""
}
variable "fingerprint" {
  default = ""
}
variable "private_key_path" {
  default = ""
}
variable "private_key_password" {
  default = ""
}
variable "region" {
  validation {
    condition     = length(trim(var.region, "")) > 0
    error_message = "Validation failed for region: value is required."
  }
}

variable "security_compartment" {
    description = "The Security compartment name or OCID where the Bastion resource is deployed."
    type = string
    default = ""
}

variable "network_compartment" {
    description = "The Network compartment name or OCID where the VCN is deployed."
    type = string
    default = ""
}

variable "bastions" {
    description = "Details of the Bastion resources to be created."
    type = map(object({
      name = string,
      vcn_name = string,
      subnet_name = string,
      allowed_cidrs = list(string),
      max_session_ttl_in_seconds = number,
      defined_tags = map(string),
      freeform_tags = map(string)
    }))
}