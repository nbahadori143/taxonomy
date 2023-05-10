job taxonomy {
  datacenters = ["dc1"]

  group taxonomy {
    count = 1
    task taxonomy {
      vault {
        policies = ["blockchainr-read-secrets"]
      }
      driver = "docker"
      config {
        image = "acrbc001.azurecr.io/taxonomy:latest"
        port_map {
          http = 3000
        }
      }
      template {
        data        = <<EOH
          PORT=3000
        EOH
        destination = "secrets/file.env"
        env         = true
      }
  
      resources {
        cpu    = 512
        memory = 1024
        network {
          port "http" {}
          mbits = 10
        }
      }
      service {
        name = taxonomy
        tags = [
          "api",
          "dev-taxonomy.blockchainr.app/"
        ]
        port = "http"
        check {
          name = "alive"
          type = "tcp"
          interval = "10s"
          timeout = "2s"
        }
      }
    }
  }

}