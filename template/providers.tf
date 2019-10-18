provider "google" {
  credentials = file("")
  project     = var.project_id
}