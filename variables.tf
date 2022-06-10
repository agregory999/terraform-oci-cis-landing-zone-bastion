# Copyright (c) 2022 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

variable "tenancy_ocid" {
  description = "The OCI tenancy id (OCID)."
}
variable "user_ocid" {
  description = "The OCI user id (OCID)."
  default = ""
}
variable "fingerprint" {
  description = "The OCI user API key fingerprint."
  default = ""
}
variable "private_key_path" {
  description = "The local path to the OCI user API private key file."
  default = ""
}
variable "private_key_password" {
  description = "The password of OCI user API private key file."
  default = ""
}
variable "region" {
  validation {
    condition     = length(trim(var.region, "")) > 0
    error_message = "Validation failed for region: a valid OCI region name is required."
  }
}
variable "security_compartment" {
    description = "The Security compartment name or OCID where the Bastion resource is deployed."
    type = string
    validation {
      condition     = length(trim(var.security_compartment, "")) > 0
      error_message = "Validation failed for security_compartment: provide either the name or OCID of CIS Landing Zone security compartment."
    }
}
variable "network_compartment" {
    description = "The Network compartment name or OCID where the Bastion VCN is deployed."
    type = string
    validation {
      condition     = length(trim(var.network_compartment, "")) > 0
      error_message = "Validation failed for network_compartment: provide either the name or OCID of CIS Landing Zone network compartment."
    }
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
    validation {
      condition     = length(var.bastions) > 0
      error_message = "Validation failed for bastions: provide the bastion data to provision."
    }
}