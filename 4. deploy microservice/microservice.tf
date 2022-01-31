resource "kubernetes_deployment" "nginx" {
    metadata {
      name = "nginx"
    }
    spec {
      selector {
        match_labels = {
          "app" = "nginx"
        }
      }
      replicas = 2
      template {
        metadata {
          labels = {
            "app" = "nginx"
          }
        }
        spec {
            container {
              name = "nginx"
              image = "nginx"
              port {
                container_port = 80
              }
            }
      }
    }
}
}
resource "kubernetes_service" "svc" {
    metadata {
      name = "nginx"
    }
    spec {
      selector = {
        "app" = "nginx"
      }
      port {
        port = 8080
        target_port = 80
      }
      type = "LoadBalancer"
    }
}