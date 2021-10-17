resource "google_compute_instance" "ansible" {
  name = "ansible-instance"
  machine_type = "e2-micro"
  zone = "${var.public_subnet_zone}"

  //  Apply the firewall rule to allow external IPs to access this instance
  tags = [ "ansible-server" ]

  network_interface {
    network = google_compute_network.sca-project-network.name
    subnetwork = google_compute_subnetwork.sca-project-public-subnet.name

    # access_config {
    #   //   Include this block to give the VM a public IP address
    # }
  }

  boot_disk {
    initialize_params {
        image = "debian-10-buster-v20210512"
        type = "pd-balanced"
        size = 10
    }
  }
}