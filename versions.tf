terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "3.4.0"
    }
  }
  required_version = ">= 1.2.6"
}
