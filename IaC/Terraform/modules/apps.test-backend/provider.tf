terraform {
  required_providers {
    k8s = {
      version = ">= 0.8.0"
      source  = "banzaicloud/k8s"
    }
  }
  required_version = ">= 0.13"
}

provider "kubernetes" {
  config_context = var.k8s_config_context
}

provider "k8s" {
  config_context = var.k8s_config_context
}

provider "helm" {
  kubernetes {
    config_context = var.k8s_config_context
  }
}
