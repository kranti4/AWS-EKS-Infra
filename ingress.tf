resource "kubernetes_ingress_v1" "app_ingress" {
  metadata {
    name      = "${var.project_name}-ingress"
    namespace = "default"
    annotations = {
      "kubernetes.io/ingress.class"           = "alb"
      "alb.ingress.kubernetes.io/scheme"      = "internet-facing"
      "alb.ingress.kubernetes.io/target-type" = "ip"
    }
  }

  spec {
    rule {
      http {
        path {
          path      = "/*"
          path_type = "Prefix"
          backend {
            service {
              name = "my-app-service" # Assumption: A service you will deploy
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }

  depends_on = [aws_eks_node_group.main]
}