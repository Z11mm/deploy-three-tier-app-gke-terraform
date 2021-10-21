# Create cluster
resource "google_container_cluster" "project-cluster" {
  name = "${var.cluster_name}"
  project = "${var.project_name}"
  location = "${var.public_subnet_zone}"

  network = google_compute_network.sca-project-network.id
  subnetwork = google_compute_subnetwork.sca-project-public-subnet.id

  remove_default_node_pool = true
  initial_node_count = 1

    # Select pod ip address range-range chosen from default size
  ip_allocation_policy {
    cluster_ipv4_cidr_block = ""
    services_ipv4_cidr_block = ""
  }
}

# Create node pools
resource "google_container_node_pool" "project-node-pool" {
  name = "${var.node_pool_name}"
  cluster = google_container_cluster.project-cluster.id
  node_count = 1

  autoscaling {
    min_node_count = var.min_node_count
    max_node_count = var.max_node_count
  }

  node_config {
    machine_type = "${var.machine_type}"
    service_account = google_service_account.db_service_account.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring"
    ]
  }
}