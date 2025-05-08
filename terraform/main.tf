terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.3.0"

  backend "gcs" {
    bucket = "${var.project_id}-tf-state"
    prefix = "igrow"
  }

}

provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_cloud_run_service" "flutter_web" {
  name     = "flutter-web"
  location = var.region

  template {
    spec {
      containers {
        image = var.container_image
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

resource "google_cloud_run_domain_mapping" "custom_domain" {
  location = var.region
  name     = var.domain_name

  metadata {
    namespace = var.project_id
  }

  spec {
    route_name = google_cloud_run_service.flutter_web.name
  }
}