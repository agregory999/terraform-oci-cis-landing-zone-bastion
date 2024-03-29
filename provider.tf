# Copyright (c) 2022 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

provider "oci" {
  region               = var.region
  tenancy_ocid         = var.tenancy_ocid
  user_ocid            = var.user_ocid
  fingerprint          = var.fingerprint
#  private_key_path     = var.private_key_path
  private_key          = var.private_key
#  private_key_password = var.private_key_password
}

terraform {
  required_providers {
    oci = {
      source = "oracle/oci"
      version = ">=4.78.0"
    }
  }
}
