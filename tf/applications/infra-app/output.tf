output "container_list" {
  value = [
    {"Container name": docker_container.grafana.name,"Container ID": docker_container.grafana.id , 
      "Container DNS names": flatten( docker_container.grafana.networks_advanced[*].aliases) } ,
    {"container name": docker_container.prometheus.name,"Container ID": docker_container.prometheus.id ,
      "Container DNS names": flatten([for dns in docker_container.prometheus.networks_advanced: dns.aliases ])}
  ]
}
