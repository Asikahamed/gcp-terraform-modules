resource "google_service_account" "this" {
  for_each     = var.service_accounts
  project      = var.project_id
  account_id   = each.value.account_id
  display_name = each.value.display_name
  description  = each.value.description 
}

resource "google_project_iam_member" "sa_roles" {
  for_each     = toset(var.roles)
  project      = var.project_id
  role         = each.value
  member       = "serviceAccount:${google_service_account.this[each.key].email}"
}