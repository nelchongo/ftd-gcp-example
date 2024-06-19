variable "project_id" {
  description   = "The GCP project ID"
  type          = string
  default       = "data-analytics-test-426921"
}

variable "region" {
  description   = "The region where GCP resources will be created"
  type          = string
  default       = "us-east1"
}

variable "zone" {
  description = "The zone where GCP resources will be created"
  type        = string
  default     = "us-east1-b"
}