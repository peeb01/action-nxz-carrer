resource "kubernetes_namespace" "app_namespace" {
  metadata {
    name = var.namespace
  }
}

resource "kubernetes_deployment" "nxz_deployment" {
  depends_on = [kubernetes_namespace.app_namespace]
  metadata {
    name      = var.app_name
    namespace = var.namespace
    labels = {
      app = var.app_label
    }
  }

  spec {
    replicas = var.replicas
    selector {
      match_labels = {
        app = var.app_label
      }
    }
    template {
      metadata {
        labels = {
          app = var.app_label
        }
      }
      spec {
        container {
          name  = var.app_label
          image = var.image
          image_pull_policy = "IfNotPresent"

          port {
            container_port = var.container_port
          }

          resources {
            limits = {
              cpu    = "500m"
              memory = "512Mi"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "nxz_service" {
  depends_on = [kubernetes_namespace.app_namespace]
  metadata {
    name      = var.service_name
    namespace = var.namespace
  }

  spec {
    selector = {
      app = var.app_label
    }
    port {
      protocol    = "TCP"
      port        = var.container_port
      target_port = var.container_port
    }
    type = var.service_type
  }
}
