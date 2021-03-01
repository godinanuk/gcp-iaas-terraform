resource "google_compute_network" "vpc_network" {
  name = "train-network"
  project = var.project
  auto_create_subnetworks = "false"
  routing_mode = "REGIONAL"

}

resource "google_compute_router" "vpc_router" {
  name = "train-router"

  project = var.project
  region  = var.region
  network = google_compute_network.vpc_network.self_link
}


# Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "${var.project}-subnet"
  project       = var.project
  region        = var.region
  network       = google_compute_network.vpc_network.name
  ip_cidr_range = "10.10.0.0/24"


}

resource "google_compute_firewall" "iaas" {
  name    = "iaas-firewall"
  project = var.project
  network = google_compute_network.vpc_network.name

  direction = "INGRESS"
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "3306", "8090"]
  }

  source_tags = ["open-iaas"]


}

