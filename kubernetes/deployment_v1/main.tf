resource "kubernetes_deployment_v1" "kubernetes_deployment_v1" {
  metadata {
    name   = var.name
    labels = {
      app  = var.name
      name = var.name
    }
  }

  spec {
    selector {
      match_labels = {
        app = var.name
      }
    }

    strategy {
      type = var.deployment_strategy
    }

    template {
      metadata {
        labels = {
          app  = var.name
          name = var.name
        }
      }

      spec {
        container {
          image             = "${var.image}"
          image_pull_policy = "Always"
          name              = var.name
          env {
            name = "ZONE"
            value = var.zone
          }
          env {
            name = "ENV_NAME"
            value = var.env_name
          }
          resources {
            requests = {
              cpu    = var.requests_cpu
              memory = var.requests_memory
            }
          }
        }

      }
    }
  }
}
