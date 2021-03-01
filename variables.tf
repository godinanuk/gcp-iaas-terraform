variable "project" {
}

variable "credentials_file" {
  default = "~/tfkey.json"
}

variable "region" {
  default = "europe-west6"
}

variable "zone" {
  default = "europe-west6-c"
}

variable "gce_ssh_user" {
}

variable "gce_ssh_pub_key_file" {
  default = "~/.ssh/id_rsa.pub"
}
