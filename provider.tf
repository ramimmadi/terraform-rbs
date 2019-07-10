provider "google" {
  credentials = "${file("./creds/serviceaccount.json")}"
  project     = "project-test-to"
  region      = "europe-west1"
}
