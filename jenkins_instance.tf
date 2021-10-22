resource "google_compute_instance" "jenkins" {
  name = "jenkins-instance"
  machine_type = "e2-medium"
  zone = "${var.instance_zone}"
  allow_stopping_for_update = true

  //  Apply the firewall rule to allow external IPs to access this instance
  tags = [ "jenkins-server", "http-server" ]

  network_interface {
    network = google_compute_network.sca-project-network.name
    subnetwork = google_compute_subnetwork.sca-project-public-subnet.name

    access_config {
      //   Include this block to give the VM a public IP address
    }
  }

  boot_disk {
    initialize_params {
        image = "debian-10-buster-v20210512"
        type = "pd-balanced"
        size = 10
    }
  }

  service_account {
     scopes = ["cloud-platform"]
   }

}
