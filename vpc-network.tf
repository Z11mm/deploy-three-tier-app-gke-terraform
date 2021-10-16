# Create vpc for project
resource "google_compute_network" "sca-project-network" {
  name = "${var.vpc_name}"
  project = "${var.project_name}"
  auto_create_subnetworks = false
  routing_mode = "REGIONAL"
  mtu = 1460
}

# Create subnets
resource "google_compute_subnetwork" "sca-project-subnet" {
  
}