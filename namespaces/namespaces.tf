resource "kubernetes_namespace" "main" {
  metadata {
    annotations = {
      name = "${var.namespace}"
    }

    labels = {
      app = "${var.namespace}"
    }

    name = "${var.namespace}"
  }
}