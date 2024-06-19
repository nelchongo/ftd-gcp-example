resource "google_secret_manager_secret" "analytics-test-secret" {
  secret_id = "analytics-test-secret"
  replication {
    user_managed {
        replicas {
            location = "us-east1"
        }
    }
  }
}
