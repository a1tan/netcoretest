variable k8s_config_context {
  type = string
  description = "Config context of K8s"
}

variable namespace {
  type = string
  description = "Kubernetes namespace to deploy"
}

variable registry_server {
  type = string
  description = "Docker image repository"
}

variable registry_use_as_proxy {
  type = bool
  description = "Use registry as proxy"
}

variable imagetag {
  type = string
  description = "Tag(build id) of an image"
}