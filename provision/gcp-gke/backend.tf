terraform {
  cloud {
    organization = "gmarcha"

    workspaces {
      name = "landing-deploy-gcp-gke"
    }
  }
}
