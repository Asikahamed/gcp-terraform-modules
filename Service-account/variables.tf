variable "project_id" {
  description = "The GCP project ID"
  type        = string
  
}

variable "service_accounts" {
  description = "A map of service accounts to create"
  type        = map(object({
    account_id   = string
    display_name = string
    description  = string
  }))
}

variable "roles" {
  description = "A list of roles to assign to the service accounts"
  type        = list(string)
}
