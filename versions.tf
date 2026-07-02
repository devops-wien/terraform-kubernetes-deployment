terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "3.2.1"
    }
  }
  required_version = ">= 1.2.6"
}
