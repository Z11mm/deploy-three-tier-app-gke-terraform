resource "google_service_account" "db_service_account" {
  account_id   = "cluster-sa-id"
  display_name = "Database Service Account"

  description = "A service account to allow GKE cluster access the Cloud SQL database"
}