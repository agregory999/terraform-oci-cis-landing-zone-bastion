terraform {
    cloud {
        organization = "andremo_br"
        workspaces {
            name = "landing_zone"
        }
    }
}