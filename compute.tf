// Terraform plugin for creating random ids
resource "random_id" "instance_id" {
 byte_length = 8
}

module "web-compute" {
  source = "./modules/vm-linux"
  vm-name = "web-compute-${random_id.instance_id.hex}"
  zone = var.zone
  network = google_compute_network.vpc_network.name
  subnetwork = google_compute_subnetwork.subnet.name
  static-ip = google_compute_address.web-compute-ip.address
  gce-ssh-user = var.gce_ssh_user
  gce-ssh-pub-key-file = var.gce_ssh_pub_key_file
}

module "db-compute" {
  source = "./modules/vm-linux"
  vm-name = "db-compute-${random_id.instance_id.hex}"
  zone = var.zone
  network = google_compute_network.vpc_network.name
  subnetwork = google_compute_subnetwork.subnet.name
  static-ip = google_compute_address.db-compute-ip.address
  gce-ssh-user = var.gce_ssh_user
  gce-ssh-pub-key-file = var.gce_ssh_pub_key_file
}

output "web-compute-ip" {
  value = module.web-compute.ip
}

output "db-compute-ip" {
  value = module.db-compute.ip
}
