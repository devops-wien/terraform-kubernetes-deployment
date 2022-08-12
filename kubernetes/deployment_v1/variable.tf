variable "name" {
  type = string
}

variable "image" {
  type = string
}

variable "requests_cpu" {
  type = string
}

variable "requests_memory" {
  type = string
}

variable "zone" {
  description = "Zone"
  type        = string
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
