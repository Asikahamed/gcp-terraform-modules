resource "google_artifact_registry_repository" "this" {
  project       = var.project_id
  location      = var.region
  repository_id = var.repository_id
  format        = var.format
  description   = var.description

  # Cleanup policy — auto delete old untagged images to save storage cost
  cleanup_policy_dry_run = var.cleanup_policy_dry_run

  dynamic "cleanup_policies" {
    for_each = var.enable_cleanup_policy ? [1] : []
    content {
      id     = "delete-untagged"
      action = "DELETE"
      condition {
        tag_state  = "UNTAGGED"
        older_than = "${var.untagged_retention_days * 24 * 3600}s"
      }
    }
  }

  dynamic "cleanup_policies" {
    for_each = var.enable_cleanup_policy ? [1] : []
    content {
      id     = "keep-minimum-versions"
      action = "KEEP"
      most_recent_versions {
        keep_count = var.tagged_versions_to_keep
      }
    }
  }

  labels = var.labels
}

