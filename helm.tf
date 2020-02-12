provider "helm" {
  kubernetes {
    host                   = google_container_cluster.gcp_kubernetes.endpoint
    token                  = data.google_client_config.current.access_token
    client_certificate     = base64decode(google_container_cluster.gcp_kubernetes.master_auth.0.client_certificate)
    client_key             = base64decode(google_container_cluster.gcp_kubernetes.master_auth.0.client_key)
    cluster_ca_certificate = base64decode(google_container_cluster.gcp_kubernetes.master_auth.0.cluster_ca_certificate)
  }
}
