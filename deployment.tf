# resource "kubernetes_namespace" "hhh" {
#   metadata {
#     annotations = {
#       name = "${var.namespace}"
#     }

#     labels = {
#       mylabel = "${var.namespace}"
#     }

#     name = "${var.namespace}"
#   }
# }

resource "kubernetes_deployment" "new_app" {
  metadata {
    name = "${var.deployment_name}"
    namespace = "${var.namespace}"
    labels = {
      test = "${var.deployment_name}-blockchain-data"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        test = "${var.deployment_name}-blockchain-data"
      }
    }

    template {
      metadata {
        labels = {
          test = "${var.deployment_name}-blockchain-data"
        }
      }

      spec {
        container {
          image = "${var.docker_image}"
          name  = "${var.deployment_name}-blockchain-data"
        }
      }
    }
  }
}
output "ip_address" {
  value = "${kubernetes_deployment.new_app.id}"
}