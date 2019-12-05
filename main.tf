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

# random_shuffle generates a random permutation of a list of strings given as an argument
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


# conditionals for_each
variable "chavo-test" {
  type = map
  default = {
    foo = {
      access = ["test", "bar"]
    },
    bar = {
      access = ["nottest", "alsonot"]
    },
    wut = {
      access = ["test", "wut"]
    },
  }
}

resource "null_resource" "test" {
  for_each = { for k, v in var.chavo-test : k => v if contains(v.access, "test") }

  triggers = {
    chavo-test = jsonencode(each.value)
  }
}

# iterate over a list of maps
variable "local_files" {
  type = list(object({
    content  = string
    filename = string
  }))
  default = [
    {
      content  = "chavo-a",
      filename = "a-name"
    },
    {
      content  = "chavo-b",
      filename = "b-name"
    },
  ]
}

locals {
  files_map = {
    for f in var.local_files :
    f.filename => f
  }
}

resource "local_file" "foo" {
  for_each = local.files_map
  content  = each.value.content
  filename = each.value.filename
}
