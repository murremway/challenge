provider "oci" {
  tenancy_ocid     = "var.compartment_id"
  user_ocid        = "var.user_ocid"
  fingerprint      = "var.fingerprint"
  private_key_path = "var.private_key_path"
  region           = "us-ashburn-1"
}

terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "~> 5.1.0"
    }
  }
}
