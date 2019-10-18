data "terraform_remote_state" "gke" {
  backend   = "remote"
  workspace = "gke"
  config = {
    organization = ""
    //Token needs to be externalized
    token     = "tf-cloud-token"
    //
    workspaces = {
      prefix = "your-prefix-"
    }
  }
}
