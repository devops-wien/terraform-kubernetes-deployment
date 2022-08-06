resource "kubernetes_service" "ingress-service" {
  metadata {
    labels = {
      app = var.name
    }
    name = var.name
  }
  spec {
    port {
      port = 80
      protocol = "TCP"
      target_port = var.target_port
    }
    selector = {
      app = var.name
    }
    type = "NodePort"
  }
}
