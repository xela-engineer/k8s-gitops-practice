variable "grafana_image_tag" {
  type = string
  default = "9.5.15"
}

variable "prometheus_image_tag" {
  type = string
  default = "v2.48.1"
}


variable "docker_ports" {
  type = list(object({
    internal = number
    external = number
    protocol = string
  }))
  default = [
    {
      internal = 8300
      external = 8300
      protocol = "tcp"
    }
  ]
}

variable "list_type" {
 description = "This is a variable of type list"
 type        = list(string)
 default     = ["string1", "string2", "string3"]
}

variable "name" {

}