provider "google" {
  project     = var.project

  region = var.region
  zone   = var.zone
}

provider "google-beta" {
  project     = var.project

  region = var.region
  zone   = var.zone
}

module "gcp-network" {
  source = "terraform-google-modules/network/google"

  project_id   = var.project
  network_name = "${var.name}-network"

  subnets = [
    {
      subnet_name   = "${var.name}-subnetwork"
      subnet_region = var.region
      subnet_ip     = "10.0.0.0/17"
    },
  ]

  secondary_ranges = {
    ("${var.name}-subnetwork") = [
      {
        range_name    = "${var.name}-ip-range-pods"
        ip_cidr_range = "192.168.0.0/18"
      },
      {
        range_name    = "${var.name}-ip-range-services"
        ip_cidr_range = "192.168.64.0/18"
      },
    ]
  }
}

module "gke" {
  source = "terraform-google-modules/kubernetes-engine/google"

  project_id = var.project
  name       = "${var.name}-default-cluster"
  region     = var.region
  zones      = var.zones

  network           = module.gcp-network.network_name
  subnetwork        = module.gcp-network.subnets_names[0]
  ip_range_pods     = "${var.name}-ip-range-pods"
  ip_range_services = "${var.name}-ip-range-services"

  remove_default_node_pool = true
  service_account          = "create"

  horizontal_pod_autoscaling = true
  http_load_balancing        = false
  network_policy             = false
  filestore_csi_driver       = false

  node_pools = [
    {
      name            = "${var.name}-default-node-pool"
      machine_type    = var.machine_type
      image_type      = var.image_type
      disk_type       = var.disk_type
      disk_size_gb    = 20
      min_count       = 1
      max_count       = 3
      local_ssd_count = 0
      spot            = false
      enable_gcfs     = false
      enable_gvnic    = false
      auto_repair     = true
      auto_upgrade    = true
      preemptible     = false
    },
  ]

  node_pools_oauth_scopes = {
    all = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
