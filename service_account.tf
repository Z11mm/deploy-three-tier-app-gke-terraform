resource "google_service_account" "db_service_account" {
  account_id   = "cluster-sa-id"
  display_name = "Database Service Account"
}