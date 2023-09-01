variable "project" {
  description = "Project ID from Google Cloud Platform"
}

variable "name" {
  description = "Prefix name for all provisioned resources"
  default     = "terraform"
}

variable "region" {
  default = "europe-west1"
}

variable "zone" {
  default = "europe-west1-b"
}

variable "zones" {
  default = ["europe-west1-b", "europe-west1-c", "europe-west1-d"]
}

variable "machine_type" {
  # default = "e2-micro"
  # default = "e2-small"
  # default = "e2-medium"
  default = "e2-standard-4"
}

variable "image_type" {
  default = "COS_CONTAINERD"
}

variable "disk_type" {
  default = "pd-standard"
}
