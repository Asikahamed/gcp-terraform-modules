output "repository_id" {
  description = "Repository ID"
  value       = google_artifact_registry_repository.this.repository_id
}

output "repository_name" {
  description = "Full resource name of the repository"
  value       = google_artifact_registry_repository.this.name
}

output "base_url" {
  description = "Base URL for pushing/pulling images (without image name)"
  value       = "${var.region}-docker.pkg.dev/${var.project_id}/${var.repository_id}"
}

output "image_url" {
  description = "Full image URL template — append :<tag> to use"
  # Usage: "${module.artifact_registry.image_url}/calculator-api:latest"
  value       = "${var.region}-docker.pkg.dev/${var.project_id}/${var.repository_id}"
}
