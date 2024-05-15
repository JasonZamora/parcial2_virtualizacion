provider "kubernetes" {
  config_path    = "~/.kube/config"  
  config_context = "minikube"       
}

# Deployment para el frontend
resource "kubernetes_deployment" "front" {
  metadata {
    name = "front"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "front"
      }
    }

    template {
      metadata {
        labels = {
          app = "front"
        }
      }

      spec {
        container {
          image = "jasongiron/front:latest"
          name  = "front"
          port {
            container_port = 5000
          }
        }
      }
    }
  }
}

# Service para el front
resource "kubernetes_service" "front-service" {
  metadata {
    name = "front-service"
  }

  spec {
    selector = {
      app = "front"
    }

    port {
      port        = 5000
      target_port = 5000
    }
  }
}




# Deployment backend
resource "kubernetes_deployment" "back" {
  metadata {
    name = "back"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "back"
      }
    }

    template {
      metadata {
        labels = {
          app = "back"
        }
      }

      spec {
        container {
          image = "jasongiron/back:latest"  
          name  = "back"
          port {
            container_port = 3037  
          }
        }
      }
    }
  }
}

# Service para el back
resource "kubernetes_service" "back-service" {
  metadata {
    name = "back-service"
  }

  spec {
    selector = {
      app = "back"
    }

    port {
      port        = 3037
      target_port = 3037  
    }
  }
}


# Deployment MongoDB
resource "kubernetes_deployment" "mongo" {
  metadata {
    name = "mongo"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "mongo"
      }
    }

    template {
      metadata {
        labels = {
          app = "mongo"
        }
      }

      spec {
        container {
          image = "mongo:latest"  
          name  = "mongo"
          port {
            container_port = 27017  
          }
        }
      }
    }
  }
}

# Service para MongoDB
resource "kubernetes_service" "mongo-service" {
  metadata {
    name = "mongo-service"
  }

  spec {
    selector = {
      app = "mongo"
    }

    port {
      port        = 27017
      target_port = 27017  
    }
  }
}
