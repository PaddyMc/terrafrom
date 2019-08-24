resource "kubernetes_ingress" "main" {
  metadata {
    name = "${var.deployment_name}-ingress"
    namespace = "${var.namespace}"

    labels = {
      app = "${var.deployment_name}"
    }

    annotations = {
      "kubernetes.io/ingress.class": "nginx"
    }
  }

  spec {
    backend {
      service_name = "${var.deployment_name}-service"
      service_port = 80
    }

    rule {
      host = "hope.chainabstraction-middleware.dev"
      http {
        path {
          backend {
            service_name = "${var.deployment_name}-service"
            service_port = 80
          }
          path = "/"
        }
      }
    }
  }
}


output "ingress" {
  value = "${kubernetes_ingress.main}"
}