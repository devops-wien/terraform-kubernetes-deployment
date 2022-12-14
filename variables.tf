variable "name" {
  type    = string
  default = "deployment"
}

variable "dns_names" {
  type    = list(string)
  default = ["example.com"]
}

variable "target_port" {
  type    = number
  default = 80
}

variable "image" {
  type    = string
  default = "yeasy/simple-web"
}

variable "requests_cpu" {
  default = "250m"
}
variable "requests_memory" {
  default = "64Mi"
}

# kubectl
variable "host" {
  description = "(Required) The hostname (in form of URI) of the Kubernetes API. Can be sourced from KUBE_HOST."
  type        = string
}

variable "client_certificate" {
  description = "(Required) PEM-encoded client certificate for TLS authentication. Can be sourced from KUBE_CLIENT_CERT_DATA."
  type        = string
}

variable "client_key" {
  description = "(Required) PEM-encoded client certificate key for TLS authentication. Can be sourced from KUBE_CLIENT_KEY_DATA."
  type        = string
}

variable "cluster_ca_certificate" {
  description = "(Required) PEM-encoded root certificates bundle for TLS authentication. Can be sourced from KUBE_CLUSTER_CA_CERT_DATA."
  type        = string
}

variable "zone" {
  description = "Zone"
  type        = string
  default     = "at-vie-1"
}

variable "env_name" {
  description = "Environment (Prod or Dev)"
  type = string
  default = "dev"
}

variable "deployment_strategy" {
  description = "(Optional) The deployment strategy to use to replace existing pods with new ones. Can be 'Recreate' or 'RollingUpdate'. Default is RollingUpdate."
  type = string
  default = "RollingUpdate"
}
