variable "service_name" {
  type = string
}

variable "region" {
  type = string
}

variable "image" {
  type = string
}

variable "service_account" {
  type    = string
  default = null
}

variable "env_vars" {
  type        = map(string)
  description = "Environment variables"
  default     = {}
}

variable "allow_unauthenticated" {
  type    = bool
  default = true
}
