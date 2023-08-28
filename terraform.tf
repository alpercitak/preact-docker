terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.21.0"
    }
  }
}

resource "docker_image" "nginx" {
  name         = "nginx:1.23.3-alpine-slim"
  keep_locally = false
}

resource "docker_image" "client_image" {
  name = "preact-docker-client"

  build {
    path       = "."
    dockerfile = "Dockerfile"
    target     = "deploy"
  }
}

resource "docker_container" "preact-docker-client" {
  image = docker_image.client_image.name
  name  = "preact-docker-client"

  must_run          = true
  restart           = "always"
  publish_all_ports = false

  ports {
    internal = 80
    external = 5173
    protocol = "tcp"
  }
}
