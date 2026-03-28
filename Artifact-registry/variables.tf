# ── Required ──────────────────────────────────────────────
variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region for the repository"
  type        = string
}

variable "repository_id" {
  description = "Unique repository ID (e.g. devops-repo)"
  type        = string
}

variable "format" {
  description = "Repository format"
  type        = string
  default     = "DOCKER"

  validation {
    condition     = contains(["DOCKER", "MAVEN", "NPM", "PYTHON"], var.format)
    error_message = "format must be one of: DOCKER, MAVEN, NPM, PYTHON"
  }
}

variable "description" {
  description = "Human-readable description of the repository"
  type        = string
  default     = ""
}

variable "labels" {
  description = "Labels to apply to the repository"
  type        = map(string)
  default     = {}
}

variable "enable_cleanup_policy" {
  description = "Enable automatic cleanup of old images — recommended for cost control"
  type        = bool
  default     = true
}

variable "cleanup_policy_dry_run" {
  description = "Dry run mode — logs what would be deleted without actually deleting"
  type        = bool
  default     = false
}

variable "untagged_retention_days" {
  description = "Delete untagged images older than this many days"
  type        = number
  default     = 7
}

variable "tagged_versions_to_keep" {
  description = "Always keep this many most recent tagged versions regardless of age"
  type        = number
  default     = 10
}
