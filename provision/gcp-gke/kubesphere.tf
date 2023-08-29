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
