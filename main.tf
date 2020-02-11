data "google_client_config" "current" {
}

resource "google_container_cluster" "gcp_kubernetes" {
  name               = var.cluster_name
  location           = "${var.cluster_zone}-a"
  initial_node_count = var.gcp_cluster_count

  master_auth {
    username = var.linux_admin_username
    password = var.linux_admin_password
  }

  node_config {
    machine_type = "n1-standard-1"
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
    tags = ["production"]
  }
}

