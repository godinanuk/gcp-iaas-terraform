// Terraform plugin for creating random ids
resource "random_id" "instance_id" {
  byte_length = 8
}

// A single Google Cloud Engine instance
resource "google_compute_instance" "gcp-vm" {
  name         = var.vm-name
  machine_type = "e2-standard-2"
  zone         = var.zone 

  tags = ["open-iaas"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-minimal-2004-lts"
    }
  }

  metadata = {
    ssh-keys = "${var.gce-ssh-user}:${file(var.gce-ssh-pub-key-file)}" 
  }

  // Make sure flask is installed on all new instances for later steps
  metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync"

  network_interface {
    network = var.network 
    subnetwork = var.subnetwork 

    access_config {
       nat_ip = var.static-ip 
    }
  }
}
