terraform {
  backend "remote" {
    organization = ""
    hostname     = "app.terraform.io"
    token        = ""

    workspaces {
      prefix = "-"
    }
  }
}
