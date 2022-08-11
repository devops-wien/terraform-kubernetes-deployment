resource "kubernetes_ingress_v1" "generic-ingress" {
  for_each = toset(var.dns_names)
  metadata {
    name   = each.key
    labels = {
      app = each.key
    }
    annotations = {
      "cert-manager.io/cluster-issuer": "letsencrypt-prod"
      "kubernetes.io/ingress.class" : "default"
      "haproxy.org/check" : "false" // todo: use http-check
      "haproxy.org/check-http" : "/health.txt"
      "haproxy.org/check-interval" : "10s"
      "haproxy.org/cors-enable": "true"
      "haproxy.org/cors-allow-credentials": "true"
    }
  }
  spec {
    rule {
      host = each.key
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
      hosts       = [each.key]
      secret_name = each.key
    }
  }
}
