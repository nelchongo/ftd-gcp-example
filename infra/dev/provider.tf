terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.60.0"
    }
  }

  backend "gcs" {
    bucket = "ftd-infrastructure-bucket"
    prefix = "data-test/state"
  }

  required_version = ">= 1.0.3"
}

provider "google" {
  project = var.project_id
  region  = var.region
}