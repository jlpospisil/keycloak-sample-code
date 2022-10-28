terraform {
  required_providers {
    keycloak = {
      source = "mrparkers/keycloak"
      version = "4.0.1"
    }

    // remove if/when real-roles-claim-fix is no longer needed
    http = {
      source = "rohdealx/http"
      version = "0.1.0"
    }
  }
  required_version = ">= 0.13"
}
