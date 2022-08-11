module "kubernetes-deployment-v1" {
  source          = "./kubernetes/deployment_v1"
  image           = var.image
  name            = var.name
  requests_cpu    = var.requests_cpu
  requests_memory = var.requests_memory
  zone            = var.zone
  env_name        = var.env_name
}

module "kubernetes-service" {
  source      = "./kubernetes/service"
  name        = var.name
  target_port = var.target_port
}

module "kubernetes-ingress" {
  source    = "./kubernetes/ingress"
  dns_names = var.dns_names
  name      = var.name
}
