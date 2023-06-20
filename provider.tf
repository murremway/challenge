provider "oci" {
  tenancy_ocid     = "ocid1.tenancy.oc1..aaaaaaaanmhxwh7dwzgzvbqmllrsge66t3v4hm4bd3ngbxmaw6bq5zyxydxa"
  user_ocid        = "ocid1.user.oc1..aaaaaaaakt26t3tvlazkdibzzp66bhlvt7ucbdghvhdc2majw2fwqpzsq2la"
  fingerprint      = "ae:90:ab:79:a5:66:d2:4e:b2:7f:36:20:6f:05:67:71"
  private_key_path = "C:/Users/murre/.oci/challenge"
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