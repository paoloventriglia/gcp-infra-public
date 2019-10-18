terraform {
  backend "remote" {
    organization = ""
    hostname     = "app.terraform.io"
    token        = "tf-cloud-token"

    workspaces {
      prefix = "your-prefix-"
    }
  }
  required_version = ">= 0.12"
}
