variable "namespace" {
  default = "nxz-c-node-app"
}

variable "app_name" {
  description = "App name"
  type        = string
  default     = "nxz-node-app-deployment"
}

variable "app_label" {
  description = "matchLabels"
  type        = string
  default     = "nxz-node-build"
}

variable "service_name" {
  description = "Service name"
  type        = string
  default     = "nxz-node-app-deployment-service"
}

variable "image" {
  description = "Docker Image"
  type        = string
  # default     = "pib21/nxz-node-app:v2"
}

variable "replicas" {
  description = "replicas set"
  type        = number
  default     = 3
}

variable "container_port" {
  description = "Port"
  type        = number
  default     = 3000
}

variable "service_type" {
  description = "Kubernetes service type"
  type        = string
  default     = "LoadBalancer"
}




