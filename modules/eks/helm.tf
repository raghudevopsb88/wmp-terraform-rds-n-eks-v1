resource "null_resource" "kube-config" {

  triggers = {
    alltime = timestamp()
  }

  provisioner "local-exec" {
    command = "aws eks update-kubeconfig --name ${var.env}"
  }

}

provider "helm" {
  kubernetes = {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"

  set = [
    {
      name  = "server.service.LoadBalancer"
      value = "enabled"
    }
  ]
}

