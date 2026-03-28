output "service_name" {
  description = "Cloud Run service name"
  value       = google_cloud_run_service.service.name
}

output "service_url" {
  description = "Public URL of the service"
  value       = google_cloud_run_service.service.status[0].url
}

output "location" {
  description = "Region where service is deployed"
  value       = google_cloud_run_service.service.location
}

output "latest_revision" {
  description = "Latest deployed revision"
  value       = google_cloud_run_service.service.status[0].latest_created_revision_name
}
