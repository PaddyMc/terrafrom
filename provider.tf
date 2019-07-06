provider "kubernetes" {
}

provider "digitalocean" {
  token = "${var.do_token}"
}
