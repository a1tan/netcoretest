terraform {
  # backend "pg" {}
}

module "bilge" {
    source        = "../../../modules/apps.test-backend"

    k8s_config_context = var.k8s_config_context
    namespace = var.namespace
    registry_server = var.registry_server
    registry_use_as_proxy = var.registry_use_as_proxy
    imagetag = var.imagetag
}