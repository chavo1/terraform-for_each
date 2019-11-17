locals {
  my_list = [
    "a",
    "b"
  ]
}

locals {
  my_map = {
    default = "c",
    latest  = "d"
  }
}

resource "null_resource" "server" {
  for_each = toset(local.my_list)
}

resource "null_resource" "server1" {
  for_each = tomap(local.my_map)
}

# For Expressions
variable "ip" {
  description = "List of ips"
  default     = ["192.168.0.1", "192.168.0.2", "192.168.0.3", "192.168.0.4", "192.168.0.5"]
}

resource "random_shuffle" "ip" {
  input = [
    for ip in var.ip :
    chomp(ip) // chomp removes newline characters at the end of a string.
  ]
}

# Splat
variable "ip_splat" {
  description = "List of ips"
  default     = ["192.168.0.6", "192.168.0.7", "192.168.0.8", "192.168.0.9", "192.168.0.10"]
}

resource "random_shuffle" "ip_splat" {
  input = var.ip_splat
}
