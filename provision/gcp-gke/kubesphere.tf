data "google_client_config" "default" {}

provider "helm" {
  kubernetes {
    host                   = "https://${module.gke.endpoint}"
    token                  = data.google_client_config.default.access_token
    cluster_ca_certificate = base64decode(module.gke.ca_certificate)
  }
}

resource "helm_release" "ks_installer" {
  name       = "ks-installer"
  namespace  = "kubesphere-system"
  repository = "https://charts.kubesphere.io/main"
  chart      = "ks-installer"
  version    = "0.3.1"

  create_namespace = true

  values = [
    "${file("config/ks-installer-values.yaml")}"
  ]
}
