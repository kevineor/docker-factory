
group "all" {
  targets = [
    "base",
    "renovate",
  ]
}

# Example for simple pull image (not recommended, prefer using pull through registry)
target "renovate" {
  name = "renovate-${version}"
  pull = true
  matrix = {
    version = ["37", "38"]
  }
  dockerfile-inline = "FROM renovate/renovate:${version}"
  tags              = concat(version_tag("tool/renovate", version), latest_tag_on_condition("tool/renovate", version == "38"))
}


target "base" {
  name = "base-${version}"
  pull = true
  matrix = {
    version = ["v1", "v2"]
  }
  dockerfile = "base/Dockerfile"
  tags       = concat(version_tag("base", version), latest_tag_on_condition("base", version == "v1"))
}



############################################
# Variables
############################################

variable "DATAHUB_REGISTRY" {
  default = "localhost:5001"
}

variable "ENVIRONMENT" {
  default = "dev"
}

############################################
# Functions
############################################

function "latest_tag" {
  params = [image_name]
  result = ENVIRONMENT == "prod" ? ["${DATAHUB_REGISTRY}/${image_name}:latest"] : ["${DATAHUB_REGISTRY}/${image_name}:latest-rc"]
}

function "version_tag" {
  params = [image_name, version]
  result = ENVIRONMENT == "prod" ? ["${DATAHUB_REGISTRY}/${image_name}:${version}"] : ["${DATAHUB_REGISTRY}/${image_name}:${version}-rc"]
}

function "latest_tag_on_condition" {
  params = [image_name, condition]
  result = condition ? latest_tag(image_name) : []
}
