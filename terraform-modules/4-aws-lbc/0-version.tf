terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92"
    }
    helm = {         
      source  = "hashicorp/helm"
      version = ">= 2.6.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "3.0.1"
    }
  }

  required_version = ">= 1.2"
}