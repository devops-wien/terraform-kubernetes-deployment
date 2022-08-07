resource "kubernetes_ingress_v1" "generic-ingress" {
  metadata {
    name   = var.dns_name
    labels = {
      app = var.dns_name
    }
    annotations = {
      "cert-manager.io/cluster-issuer": "letsencrypt-prod"
      "kubernetes.io/ingress.class" : "default"
      "haproxy.org/check" : "false" // todo: use http-check
      "haproxy.org/check-http" : "/health.txt"
      "haproxy.org/check-interval" : "10s"
    }
  }
  spec {
    rule {
      host = var.dns_name
      http {
        path {
          path = "/"
          backend {
            service {
              name = var.name
              port {
                number = 80
              }
            }
          }
        }
      }
    }

    tls {
      hosts       = [var.dns_name]
      secret_name = var.dns_name
    }
  }
}
