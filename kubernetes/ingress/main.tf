resource "kubernetes_ingress_v1" "generic-ingress" {
  for_each = toset(var.dns_names)
  metadata {
    name   = "${var.name}-${replace(each.key, "_","-")}"
    labels = {
      app = "${var.name}-${replace(each.key, "_","-")}"
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
      host = each.value
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
      hosts       = [each.value]
      secret_name = each.value
    }
  }
}
