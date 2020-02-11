
provider "google" {
  credentials = file("../k8s-configuration/access.json")
  project     = var.project_name
  region      = var.cluster_zone
}