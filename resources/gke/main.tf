locals {
  cluster_type = "simple-regional"
}

module "gke" {
  #source                 = "git@github.com:paoloventriglia/gcp-infrastructure-modules.git//gke"
  source                 = "../../../gcp-infrastructure-modules/gke"
  project_id             = var.project_id
  name                   = "${local.cluster_type}-cluster${var.cluster_name_suffix}"
  regional               = true
  region                 = var.region
  network                = var.network
  subnetwork             = var.subnetwork
  ip_range_pods          = var.ip_range_pods
  ip_range_services      = var.ip_range_services
  create_service_account = false
  service_account        = var.compute_engine_service_account
}

data "google_client_config" "default" {
}

