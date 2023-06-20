  resource "oci_core_vcn" "challenge" {
    compartment_id = "var.compartment_ocid"
    cidr_block = "10.0.0.0/16"
    dns_label    = "vcn"
  }

  resource "oci_core_subnet" "challenge" {
    compartment_id = "var.compartment_ocid"
    vcn_id = oci_core_vcn.challenge.id
    cidr_block = "10.0.0.0/16"
    dns_label    = "subnet"
  }

  resource "oci_core_internet_gateway" "challenge" {
  compartment_id = "var.compartment_ocid"
  vcn_id         = oci_core_vcn.challenge.id

  display_name = "challenge"
  }

  resource "oci_core_default_route_table" "challenge" {
  manage_default_resource_id = oci_core_vcn.challenge.default_route_table_id

  display_name = "challenge"

  route_rules {
    network_entity_id = oci_core_internet_gateway.challenge.id

    description = "Default route"
    destination = "0.0.0.0/0"
  }
}

  resource "oci_core_network_security_group" "challenge" {
    compartment_id = "var.compartment_ocid"
    vcn_id         = oci_core_vcn.challenge.id
  }

  resource "oci_core_network_security_group_security_rule" "challenge" {
    network_security_group_id = oci_core_network_security_group.challenge.id

    direction   = "INGRESS"
    protocol = "6"
    source_type = "CIDR_BLOCK"
    source      = "0.0.0.0/0"
    tcp_options {
      destination_port_range {
        min = 22
        max = 22
    }
  }
}

  resource "oci_core_network_security_group_security_rule" "challenge_http" {
    network_security_group_id = oci_core_network_security_group.challenge.id

    direction   = "INGRESS"
    protocol = "6"
    source_type = "CIDR_BLOCK"
    source      = "0.0.0.0/0"
    tcp_options {
      destination_port_range {
        min = 8080
        max = 8080
    }
  }
}

  resource "oci_core_network_security_group_security_rule" "grafana" {
    network_security_group_id = oci_core_network_security_group.challenge.id

    direction   = "INGRESS"
    protocol = "6"
    source_type = "CIDR_BLOCK"
    source      = "0.0.0.0/0"
    tcp_options {
      destination_port_range {
        min = 3000
        max = 3000
    }
  }
}
