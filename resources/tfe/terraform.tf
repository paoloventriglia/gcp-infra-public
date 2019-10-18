provider "google" {
  credentials = file("../credentials.json")
  project     = var.project_id
}

provider "tfe" {
  token        = "tf-cloud-token"
}

terraform {
  backend "remote" {
    organization = ""
    hostname     = "app.terraform.io"
    token        = "tf-cloud-token"

    workspaces {
      prefix = "your-prefix-"
    }
  }
}

