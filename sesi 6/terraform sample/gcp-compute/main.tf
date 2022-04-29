terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.16.0"
    }
  }
}

provider "google" {
  project     = "black-burner-346603"
  region      = "us-central1"
}

resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

 

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = "953895844838-compute@developer.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
}