locals {
  sa_role_bindings = {
    for pair in flatten([
      for sa_key, sa in google_service_account.this : [
        for role in var.roles : {
          key   = "${sa_key}-${role}"
          email = sa.email
          role  = role
        }
      ]
    ]) : pair.key => {
      email = pair.email
      role  = pair.role
    }
  }
}
