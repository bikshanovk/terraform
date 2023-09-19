terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "argocd" {
  name       = "argo-cd"

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  #namespace = "argocd"
}

resource "helm_release" "argocd-apps" {
  name       = "argocd-apps"

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argocd-apps"
  #namespace = "argocd"
}