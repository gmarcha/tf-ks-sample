variable "project" {
  description = "Project ID from Google Cloud Platform"
}

variable "credentials_file" {
  description = "Path to the json credentials file from Google Cloud Platform"
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
