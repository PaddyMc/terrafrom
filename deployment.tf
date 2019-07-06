resource "kubernetes_namespace" "hhh" {
  metadata {
    annotations = {
      name = "go-apis"
    }

    labels = {
      mylabel = "go-api"
    }

    name = "go-apis"
  }
}

resource "kubernetes_deployment" "api" {
  metadata {
    name = "blockchain-api"
    labels = {
      test = "EthereumScraper"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        test = "EthereumScraper"
      }
    }

    template {
      metadata {
        labels = {
          test = "EthereumScraper"
        }
      }

      spec {
        container {
          image = "${var.dockerimage}"
          name  = "go-ethereum"
        }
      }
    }
  }
}


data "digitalocean_ssh_key" "bbk" {
  name = "bbk"
}

output "ip_address" {
  value = "${kubernetes_deployment.api}"
}