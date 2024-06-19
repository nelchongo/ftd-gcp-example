resource "google_project_iam_custom_role" "secret_reader" {
  role_id     = "secretReader"
  title       = "Secret Reader"
  description = "A role that can read a specific secret from Secret Manager"
  permissions = [
    "secretmanager.versions.access"
  ]
  project     = var.project_id
}
