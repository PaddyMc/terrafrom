resource "digitalocean_droplet" "web" {
  image    = "ubuntu-18-10-x64"
  name     = "paddy-web-1"
  region   = "fra1"
  size     = "s-1vcpu-3gb"
  ssh_keys = ["${data.digitalocean_ssh_key.hope.fingerprint}"]
}

resource "null_resource" "setup" {
  provisioner "remote-exec" {
    connection {
      host        = "${digitalocean_droplet.web.ipv4_address}"
      type        = "ssh"
      user        = "root"
      private_key = "${file("~/.ssh/id_rsa")}"
    }
    inline = [
      "apt-get update -y",
      "apt-get install nginx -y",
      "apt-get install docker.io -y",
      "docker pull ${var.dockerimage}",
      "docker run -p 3000:3000 ${var.dockerimage}"
    ]
  }
}

data "digitalocean_ssh_key" "hope" {
  name = "hope"
}

resource "digitalocean_domain" "default" {
  name       = "${var.domain}"
  ip_address = "${digitalocean_droplet.web.ipv4_address}"
}

output "ip_address" {
  value = "${digitalocean_droplet.web.ipv4_address}"
}