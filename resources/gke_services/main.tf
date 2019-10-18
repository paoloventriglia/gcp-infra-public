locals {
  cluster_type = "deploy-service"
}

provider "google" {
  version = "~> 2.12.0"
  region  = var.region
}

provider "kubernetes" {
  load_config_file       = false
  host                   = "https://${data.terraform_remote_state.gke.outputs.kubernetes_endpoint}"
  token                  = base64decode(data.terraform_remote_state.gke.outputs.client_token)
  cluster_ca_certificate = base64decode(data.terraform_remote_state.gke.outputs.ca_certificate)
}

//data "google_client_config" "default" {
//}

resource "kubernetes_pod" "nginx-example" {
  metadata {
    name = "nginx-example"

    labels = {
      maintained_by = "terraform"
      app           = "nginx-example"
    }
  }

  spec {
    container {
      image = "nginx:1.7.9"
      name  = "nginx-example"
    }
  }

  depends_on = [data.terraform_remote_state.gke]
}

resource "kubernetes_service" "nginx-example" {
  metadata {
    name = "terraform-example"
  }

  spec {
    selector = {
      app = kubernetes_pod.nginx-example.metadata[0].labels.app
    }

    session_affinity = "ClientIP"

    port {
      port        = 8080
      target_port = 80
    }

    type = "LoadBalancer"
  }

  depends_on = [data.terraform_remote_state.gke]
}
