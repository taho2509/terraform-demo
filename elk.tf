data "helm_repository" "elastic" {
  name = "elastic"
  url  = "https://helm.elastic.co"
}

resource "helm_release" "elasticsearch" {
  name  = "elasticsearch"
  chart = "elastic/elasticsearch"
  repository = data.helm_repository.elastic.metadata[0].name
}

resource "helm_release" "kibana" {
  name  = "kibana"
  chart = "elastic/kibana"
  repository = data.helm_repository.elastic.metadata[0].name
}

resource "helm_release" "metricbeat" {
  name  = "metricbeat"
  chart = "elastic/metricbeat"
  repository = data.helm_repository.elastic.metadata[0].name
}
