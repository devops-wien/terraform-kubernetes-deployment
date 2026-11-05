terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "3.5.0"
    }
  }
  required_version = ">= 1.2.6"
}
