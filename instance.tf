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
metadata_startup_script = "sudo rm -rf /var/lib/tomcat8/webapps/petclinic.war;sudo gsutil cp gs://project-test-to-kubernetes-manifests/petclinic.war  /var/lib/tomcat8/webapps/;sudo systemctl restart tomcat8"
}


