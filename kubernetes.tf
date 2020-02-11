provider "kubernetes" {
  load_config_file = false

  host                   = "https://${google_container_cluster.gcp_kubernetes.endpoint}"
  token                  = data.google_client_config.current.access_token
  client_certificate     = base64decode(google_container_cluster.gcp_kubernetes.master_auth.0.client_certificate)
  client_key             = base64decode(google_container_cluster.gcp_kubernetes.master_auth.0.client_key)
  cluster_ca_certificate = base64decode(google_container_cluster.gcp_kubernetes.master_auth.0.cluster_ca_certificate)
}

resource "kubernetes_namespace" "default" {
  metadata {
    name = "drone"
  }
}

resource "kubernetes_secret" "gcp_secret" {
  metadata {
    name = "drone-server-secrets"
    namespace = kubernetes_namespace.default.id
  }

  data = {
      clientSecret = var.github_client_secret
  }
}