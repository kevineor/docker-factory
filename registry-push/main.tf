terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"

  registry_auth {
    address  = "http://localhost:5001"
    username = "bla"
    password = "bla"
  }
}

locals {
  images = yamldecode(file("${path.module}/../meta.json"))
  split_images = merge({
    for image in local.images : image["image.name"] => {
      for name in split(",", image["image.name"]) :
      name => {
        name   = name
        digest = image["containerimage.digest"]
      }
    }
  })
  all_images = merge([for key, nested_map in local.split_images : nested_map]...)
}

resource "docker_registry_image" "image" {
  for_each = local.all_images
  name     = each.key
  triggers = {
    digest = each.value.digest
  }
}

output "image_list" {
  value = keys(local.all_images)

}
