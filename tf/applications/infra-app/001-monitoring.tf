# This is a tf mainly for monitoring tools

resource "docker_image" "prometheus" {
  name         = "prom/prometheus:latest"
  keep_locally = false
}


resource "docker_volume" "prometheus-data" {
  name = "prometheus-data"
}


resource "docker_container" "prometheus" {
  image = docker_image.prometheus.image_id
  name  = "lab-prometheus"

  ports {
    internal = 9090
    external = 9090
  }
  volumes {
    container_path  = "/etc/prometheus/prometheus.yml"
    read_only = false
    host_path = "/c/Users/Alex/Documents/Container-services/Prometheus/prometheus.yml"
   #volume_name = "${docker_volume.dashing_public.name}"
  }

  volumes {
    container_path  = "/prometheus"
    read_only = false
    volume_name = "${docker_volume.prometheus-data.name}"
  }
}
