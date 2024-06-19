resource "google_compute_instance" "vm_instance" {
  name         = "vm-instance"
  machine_type = "e2-medium"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  service_account {
    email  = google_service_account.vm_service_account.email
    scopes = ["cloud-platform"]
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    echo "Startup script running..."
    EOT
}

resource "google_service_account" "vm_service_account" {
  account_id   = "vm-service-account"
  display_name = "VM Service Account"
}

resource "google_project_iam_binding" "service_account_binding" {
  project = var.project_id
  role    = google_project_iam_custom_role.secret_reader.name
  members = [
    "serviceAccount:${google_service_account.vm_service_account.email}"
  ]
}

resource "google_secret_manager_secret_iam_binding" "secret_access" {
  secret_id = google_secret_manager_secret.analytics-test-secret.id
  role      = "roles/secretmanager.secretAccessor"
  members = [
    "serviceAccount:${google_service_account.vm_service_account.email}"
  ]
}
