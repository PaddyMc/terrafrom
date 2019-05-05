# resource "digitalocean_kubernetes_cluster" "paddy" {
#   name    = "paddy-cluster"
#   region  = "fra1"
#   version = "1.12.1-do.2"

#   node_pool {
#     name       = "woker-pool"
#     size       = "s-2vcpu-2gb"
#     node_count = 3
#   }
# }
