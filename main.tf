provider "google" {
  credentials = "${var.gcp_credentials}"
  project = "${var.project_name}"
}

terraform {
  backend "gcs" {
      credentials = "./key.json"
      bucket = "sca-cloud-school-remote-backend-tf"
      prefix = "sca-workspaces"
  }
}