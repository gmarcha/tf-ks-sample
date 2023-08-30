provider "google" {
  project     = var.project
  credentials = file(var.credentials_file)

  region = var.region
  zone   = var.zone
}

resource "google_kms_key_ring" "terraform_state" {
  name     = "${var.name}-bucket-tfstate"
  location = "global"
}

resource "google_kms_crypto_key" "terraform_state_bucket" {
  name     = "${var.name}-bucket-tfstate"
  key_ring = google_kms_key_ring.terraform_state.id
}

resource "google_storage_bucket" "default" {
  name          = "${var.name}-bucket-tfstate"
  location      = "EU"
  storage_class = "STANDARD"
  force_destroy = true
  versioning {
    enabled = true
  }
  encryption {
    default_kms_key_name = google_kms_crypto_key.terraform_state_bucket.id
  }
}
