resource "google_service_account" "this" {
  for_each = var.service_accounts

  project      = var.project_id
  account_id   = each.value.account_id
  display_name = each.value.display_name
  description  = each.value.description
}

resource "google_project_iam_member" "sa_roles" {
  for_each = local.sa_role_bindings

  project = var.project_id
  role    = each.value.role
  member  = "serviceAccount:${each.value.email}"
}
