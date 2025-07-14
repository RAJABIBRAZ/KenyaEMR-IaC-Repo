resource "kubernetes_deployment" "mysql" {
  metadata {
    name      = "mysql"
    namespace = "default"
    labels = {
      app = "mysql"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "mysql"
      }
    }

    template {
      metadata {
        labels = {
          app = "mysql"
        }
      }

      spec {
        container {
          name  = "mysql"
          image = "mysql:8.0"

          port {
            container_port = 3306
          }

          env {
            name  = "MYSQL_ROOT_PASSWORD"
            value = "openmrs"
          }

          args = [
            "--default-authentication-plugin=mysql_native_password"
          ]

          volume_mount {
            name       = "mysql-storage"
            mount_path = "/var/lib/mysql"
          }
          
          volume_mount {
            name       = "init-sql"
            mount_path = "/docker-entrypoint-initdb.d"
          }

        }

        volume {
          name = "mysql-storage"
          empty_dir {}
        }

        volume {
          name = "init-sql"
          config_map {
            name = kubernetes_config_map.init_sql.metadata[0].name
           } 
        }
      }
    }
  }
}

resource "kubernetes_service" "mysql" {
  metadata {
    name      = "mysql"
    namespace = "default"
  }

  spec {
    selector = {
      app = "mysql"
    }

    port {
      port        = 3306
      target_port = 3306
    }
  }
}

resource "kubernetes_config_map" "init_sql" {
  metadata {
    name      = "mysql-init-sql"
    namespace = "default"
  }

  data = {
    "tenants.sql" = file("${path.module}/init/tenants.sql")
  }
}
