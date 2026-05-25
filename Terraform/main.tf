terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "app_image" {
  name         = "devops-app:latest"
  keep_locally = true
}

resource "docker_container" "app_container" {
  name  = "terraform-devops-app"
  image = docker_image.app_image.image_id

  ports {
    internal = 3000
    external = 8080
  }
}

