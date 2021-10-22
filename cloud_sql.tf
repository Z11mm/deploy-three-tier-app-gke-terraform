# Specify ip addresses to allow to connect from outside gcp
locals {
  onprem = ["160.152.163.144", "129.205.112.187"]
}

# Create db instance
resource "google_sql_database_instance" "postgres" {
  name = "${var.db_instance_name}"
  database_version = "${var.db_version}"
  region = "${var.public_subnet_region}"
  deletion_protection = false

  settings {  
    tier = "db-f1-micro"
    ip_configuration {
      ipv4_enabled = true
    
      // add the ip addresses from the locals block
      dynamic "authorized_networks" {
        for_each = local.onprem
        iterator = onprem

        content {
          name = "onprem-${onprem.key}"
          value = onprem.value
        }
      }

    }
    location_preference {
      zone = "${var.instance_zone}"
    }
  }
}

# Create db within instance
resource "google_sql_database" "postgres-db" {
  name = "${var.db_name}"
  instance = google_sql_database_instance.postgres.name
}

# # Create db user
resource "google_sql_user" "postgres" {
  name = "${var.db_username}"
  password = "${var.db_user_passwd}"
  instance = google_sql_database_instance.postgres.name
}