resource "kubernetes_deployment" "main" {
  metadata {
    name = "${var.deployment_name}"
    namespace = "${var.namespace}"
    labels = {
      app = "${var.deployment_name}"
    }
  }
 
  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "${var.deployment_name}"
      }
    }

    template {
      metadata {
        labels = {
          app = "${var.deployment_name}"
        }
      }

      spec {
        container {
          image = "${var.docker_image}"
          name  = "${var.deployment_name}"
        }
      }
    }
  }
}