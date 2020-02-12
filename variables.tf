// General Variables

variable "project_name" {
  type = string
  description = "google project in which the cluster will live."
}

variable "linux_admin_username" {
  type = string
  description = "User name for authentication to the Kubernetes linux agent virtual machines in the cluster."
}

variable "linux_admin_password" {
  type = string
  description = "The password for the Linux admin account."
}

// GCP Variables
variable "gcp_cluster_count" {
  type = string
  description = "Count of cluster instances to start."
}

variable "cluster_name" {
  type = string
  description = "Cluster name for the GCP Cluster."
}

variable "cluster_zone" {
  type = string
  description = "Cluster zone."
}

variable "github_client_secret" {
  type = string
  description = "The client secret to connect drone to github."
}

variable "github_client_id" {
  type = string
  description = "The client id to connect drone to github."
}

variable "github_user" {
  type = string
  description = "The github user account."
}

// GCP Outputs
output "gcp_cluster_endpoint" {
  value = "${google_container_cluster.gcp_kubernetes.endpoint}"
}

output "gcp_ssh_command" {
  value = "ssh ${var.linux_admin_username}@${google_container_cluster.gcp_kubernetes.endpoint}"
}

output "gcp_cluster_name" {
  value = "${google_container_cluster.gcp_kubernetes.name}"
}

output "drone_endpoint" {
  value = "${data.kubernetes_service.drone_ingress.load_balancer_ingress[0].ip}"
}

output "kong_endpoint" {
  value = "${data.kubernetes_service.kong_ingress.load_balancer_ingress[0].ip}"
}