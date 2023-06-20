
  resource "oci_core_instance" "challenge" {
    compartment_id = "ocid1.tenancy.oc1..aaaaaaaanmhxwh7dwzgzvbqmllrsge66t3v4hm4bd3ngbxmaw6bq5zyxydxa"
    shape = "VM.Standard1.1"
    availability_domain = data.oci_identity_availability_domain.challenge.name

    source_details {
        source_id = "ocid1.image.oc1.iad.aaaaaaaaau2eo3mjbgtmjvocmvx5xbhcmj2ay3mvowdzffxhdiql5gnhxjqa"
        source_type = "image"
    }

    create_vnic_details {
    display_name     = "challenge" 
    hostname_label   = "challenge"
    nsg_ids          = [oci_core_network_security_group.challenge.id]
    subnet_id        = oci_core_subnet.challenge.id
    assign_public_ip = true    
    }

    metadata = {
        ssh_authorized_keys = file("challenge.pub")
        user_data = "${base64encode(file("bootscript.sh"))}"
    }
  }

  
data "oci_identity_availability_domain" "challenge" {
  compartment_id = "ocid1.tenancy.oc1..aaaaaaaanmhxwh7dwzgzvbqmllrsge66t3v4hm4bd3ngbxmaw6bq5zyxydxa"
  ad_number      = 3
}