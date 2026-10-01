terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "3.3.0"
    }
  }
  required_version = ">= 1.2.6"
}
