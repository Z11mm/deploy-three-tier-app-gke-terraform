# Create vpc for project
resource "google_compute_network" "sca-project-network" {
  name = "${var.vpc_name}"
  project = "${var.project_name}"
  auto_create_subnetworks = false
  routing_mode = "REGIONAL"
  mtu = 1460
}

# Create subnets
resource "google_compute_subnetwork" "sca-project-private-subnet" {
  name = "${var.private_subnet_name}"
  ip_cidr_range = "${var.private_subnet_cidr}"
  network = "${var.vpc_name}"
  private_ip_google_access = true
  region = "${var.private_subnet_region}"
}
resource "google_compute_subnetwork" "sca-project-public-subnet" {
  name = "${var.public_subnet_name}"
  ip_cidr_range = "${var.public_subnet_cidr}"
  network = "${var.vpc_name}"
  region = "${var.public_subnet_region}"
}

