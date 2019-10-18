provider "google" {
  version = "~> 2.10.0"
  credentials = file("../../credentials.json")
  project     = var.project_id
}

provider "null" {
  version = "~> 2.1"
}