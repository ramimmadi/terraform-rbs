resource "google_compute_instance" "rbs-devinstance" {
  name         = var.instance-name
  project      = var.project_id
  machine_type = var.instance_type
  zone         = var.instance_zone

  boot_disk {
    initialize_params {
      image = var.instance_image
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP
    }
  }
}


