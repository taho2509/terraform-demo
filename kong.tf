data "helm_repository" "kong" {
  name = "kong"
  url  = "https://charts.konghq.com"
}

resource "helm_release" "kong" {
  name  = "kong"
  chart = "kong/kong"
  repository = data.helm_repository.kong.metadata[0].name
  skip_crds = "true"

  set {
    name  = "ingressController.installCRD"
    value = "false"
  }
}

data "kubernetes_service" "kong_ingress" {
  metadata {
    name = "kong-${helm_release.kong.name}-proxy"
  }
}