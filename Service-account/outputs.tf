output "service_account_emails" {
  value = {
    for k, sa in google_service_account.this :
    k => sa.email
  }
}

output "service_account_names" {
  value = {
    for k, sa in google_service_account.this :
    k => sa.name
  }
}
