terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.25.0"
    }
  }
}

provider "google" {
  # Configuration options
project = "optimum-airfoil-416401"
region = "us-central1"
zone = "us-central1-a"
credentials = "optimum-airfoil-416401-dddbbaaee7d0.json"
}

resource "google_storage_bucket" "demo-bucket-1" {
  name          = "demo_name_for_class"
  location      = "US" #can be us-central1
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}