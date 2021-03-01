variable "vm-name" {
  description = "Name of the VM"
}

variable "zone" {
  description = "GCP zone"
}

variable "network" {
  description = "GCP network"
}

variable "subnetwork" {
  description = "GCP subnetwork"
}

variable "static-ip" {
  description = "Static IP address"
}

variable "gce-ssh-user" {
  description = "GCE SSH username"
}

variable "gce-ssh-pub-key-file" {
  description = "GCE SSH Public Key file"
}
