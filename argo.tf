locals {
  argoNs = "argo"
}

resource "kubernetes_namespace" "argocdNs" {
  depends_on = [module.eks]
  metadata {
    name = local.argoNs
  }
}

resource "null_resource" "applyArgoCDManifests" {
  depends_on = [kubernetes_namespace.argocdNs]
  provisioner "local-exec" {
      command = "kubectl apply -f argo.yaml --namespace ${local.argoNs}"
      working_dir = "."
  }
}