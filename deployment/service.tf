resource "kubernetes_service" "main" {
  metadata {
    name             = "${var.deployment_name}-service"
    namespace        = "${var.namespace}"

    labels = {
      app            = "${var.deployment_name}-service"
    }
  }
  spec {
    selector = {
      app            = "${var.deployment_name}"
    }
    
    # session_affinity = "ClientIP"

    port {
      port = 80
    }

    # type = "LoadBalancer"
  }
}
