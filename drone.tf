resource "helm_release" "drone" {
  name  = "drone"
  chart = "stable/drone"
  namespace = kubernetes_namespace.default.id

  set_string {
    name  = "service.type"
    value = "LoadBalancer"
  }

  set_string {
    name  = "sourceControl.provider"
    value = "github"
  }

  set_string {
    name  = "sourceControl.github.clientID"
    value = var.github_client_id
  }

  set_string {
    name  = "sourceControl.github.clientSecretKey"
    value = "clientSecret"
  }

  set_string {
    name  = "sourceControl.github.clientSecretValue"
    value = var.github_client_secret
  }

  set {
    name  = "server.kubernetes.enabled"
    value = "true"
  }

  set_string {
    name  = "server.adminUser"
    value = var.github_user
  }

  set {
    name  = "persistence.enabled"
    value = "true"
  }
}

data "kubernetes_service" "drone_ingress" {
  metadata {
    name = "${kubernetes_namespace.default.id}-${helm_release.drone.name}"
    namespace = kubernetes_namespace.default.id
  }
}