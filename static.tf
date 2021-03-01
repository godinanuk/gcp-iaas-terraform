resource "google_compute_address" "web-compute-ip" {
  name = "web-static-ip"
}

resource "google_compute_address" "db-compute-ip" {
  name = "db-static-ip"
}
