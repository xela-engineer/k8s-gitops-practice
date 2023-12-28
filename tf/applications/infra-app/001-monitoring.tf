# This is a tf mainly for monitoring tools
# TODO: add variables
# ============= docker_network ==========
resource "docker_network" "monitoring_network" {
  name = "monitoring_network"
  driver = "bridge"
}
# =============== Resources for Prometheus ========================
# podman run -d -p 9090:9090 -v C:\Users\Alex\Documents\Container-services\Prometheus\prometheus.yml:/etc/prometheus/prometheus.yml -v prometheus-data:/prometheus  prom/prometheus
resource "docker_image" "prometheus" {
  name         = "prom/prometheus:${var.prometheus_image_tag}"
  keep_locally = false
}


resource "docker_volume" "prometheus-data" {
  name = "prometheus-data"
}


resource "docker_container" "prometheus" {
  image = docker_image.prometheus.image_id
  name  = "lab-prometheus"

  networks_advanced {
    name    = docker_network.monitoring_network.name
    aliases = ["prometheus"]
  }

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

# =============== Resources for Grafana =========

resource "docker_image" "grafana" {
  name         = "grafana/grafana-oss:${var.grafana_image_tag}"
  keep_locally = false
}


resource "docker_volume" "grafana-data" {
  name = "grafana-data"
}


resource "docker_container" "grafana" {
  image = docker_image.grafana.image_id
  name  = "lab-grafana"
  privileged = false
  publish_all_ports = false
  user = "472" 
  working_dir = "/usr/share/grafana"
  cpu_shares = 0

  networks_advanced {
    name    = docker_network.monitoring_network.name
    aliases = ["grafana"]
  }

  ports {
    internal = 3000
    external = 3000
  }
  env = null
  volumes {
    container_path  = "/var/lib/grafana"
    read_only = false
    volume_name = "${docker_volume.grafana-data.name}"
  }
}

