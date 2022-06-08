# terraform-oci-cis-landing-zone-bastion

Terraform to manage native OCI Bastion Service resources, well suited to deploy on top of CIS OCI Landing Zone.

# Executing instructions

Create a *terraform.tfvars* input file with contents like:

    tenancy_ocid         = "ocid1.tenancy.oc1..aaaaaaaa...tgbvvv"            # the OCI tenancy id
    user_ocid            = "ocid1.user.oc1..aaaaaaaa...bdukkk"               # the OCI user id
    fingerprint          = "c1:91:41:99:00:99:00:99:00:99:00:99:00:76:54:39" # the OCI user API key fingerpring
    private_key_path     = "./private_key.pem"                               # the local path to the API private key file
    region               = "us-ashburn-1"                                    # the OCI region

    security_compartment = "visio-security-cmp" # the name or OCI id (OCID) of CIS OCI Landing Zone Security comparment, where the Bastion is going to be deployed.
    network_compartment  = "visio-network-cmp"  # the name or OCI id (OCID) of CIS OCI Landing Zone Network comparment, where the Bastion VCNs are deployed.

    # The map of Bastion resources to deploy.
    bastions = {
        "BASTION1" = {
            name = "Bastion1"                      # the Bastion resource name
            vcn_name = "this-vcn"                  # the VCN where to deploy the Bastion. It must be under the network_compartment informed above.
            subnet_name = "this-subnet"            # the subnet where to deploy the Bastion. It must be under the network_compartment informed above.
            allowed_cidrs = ["167.253.9.185/32"]   # the CIDR ranges allowed to connect to the Bastion
            max_session_ttl_in_seconds = 10800     # the max session timeout. 10800 is currently the max.
            defined_tags = null                    # defined tags.
            freeform_tags = null                   # freeform tags.
        },
        "BASTION2" = {
            name = "Bastion2"
            vcn_name = "that-vcn"
            subnet_name = "that-subnet"
            allowed_cidrs = ["167.253.9.185/32"]
            max_session_ttl_in_seconds = 10800
            defined_tags = null
            freeform_tags = null
        }
    }

Then run

    terraform init
    terraform plan -out plan.out
    terraform apply plan.out