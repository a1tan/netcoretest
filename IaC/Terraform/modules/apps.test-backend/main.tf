locals {
  publicRegistryServer = var.registry_use_as_proxy ? "${var.registry_server}/" : ""
}
resource "k8s_manifest" "backend-namespace" {
  content   = templatefile(
    "${path.module}/manifests/namespace.yaml",
    {
      namespace = var.namespace
    }
  )
  namespace = var.namespace
}
resource "k8s_manifest" "backend-deployment" {
  content   = templatefile(
    "${path.module}/manifests/deployment.yaml",
    {
      namespace = var.namespace,
      registryServer = var.registry_server
      publicRegistryServer = local.publicRegistryServer
      imagetag = var.imagetag
    }
  )
  namespace = var.namespace
  depends_on = [ k8s_manifest.backend-namespace ]
}

resource "k8s_manifest" "backend-service" {
  content   = templatefile(
    "${path.module}/manifests/service.yaml",
    {
      namespace = var.namespace,
    }
  )
  namespace = var.namespace
  depends_on = [ k8s_manifest.backend-deployment ]
}

